//
//  ShowRepoViewController.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import UIKit

//let appColor = UIColor(red: 74.0/255, green: 98.0/255, blue: 214.0/255, alpha: 1.0)

class ShowRepoViewController: UIViewController {
    var eventHandler : SearchModuleInterface? // presenter
    var repoItems: [PresentableRepository]?
    
    @IBOutlet weak var loginButton: UIBarButtonItem?
    @IBOutlet weak var tableView: UITableView?
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupSearchBar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateView()
    }
    
    private func handleTap(_ repoItem: PresentableRepository) {
        eventHandler?.showDetails(forRepo: repoItem)
    }
    
    private func startSearch(_ searchText: String) {
        eventHandler?.searchRepo(withString: searchText)
    }
    
    private func showMyRepos() {
        eventHandler?.showMyRepos()
    }
    
    func updateContent() {
        updateView()
    }
}


// actions from presenter
extension ShowRepoViewController: SearchViewInterface {
    func showNoContentMessage() {
        repoItems = nil
        updateView()
    }
    
    func showRepositories(_ repoItems: [PresentableRepository]) {
        self.repoItems = repoItems
        updateView()
    }
    
    @objc private func updateView() {
        tableView?.reloadData()
        loginButton?.title = eventHandler?.showMyReposButtonTitle()
    }
}


extension ShowRepoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoItems?.count ?? 1 // "no items" cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RepoItemTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if repoItems == nil {
            return noItemCell(tableView, cellForRowAt: indexPath)
        } else {
            return repoItemCell(tableView, cellForRowAt: indexPath)
        }
    }
    
    private func noItemCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noItemTableViewCell") else {
            return UITableViewCell()
        }
        return cell
    }
    
    private func repoItemCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoItemTableViewCell") as? RepoItemTableViewCell else {
            return UITableViewCell()
        }
        
        guard indexPath.row < repoItems?.count ?? 0,
            let aRepoItem = repoItems?[indexPath.row] else {
                return cell
        }
        
        cell.id = aRepoItem.id
        cell.nameLabel?.text = aRepoItem.name
        cell.descriptionLabel?.text = aRepoItem.description
        cell.forksCountLabel?.text = "\(aRepoItem.forksCount)"
        cell.watchersCountLabel?.text = "\(aRepoItem.watchersCount)"
        
        // fetch owner avatar
        if let avatarUrl = aRepoItem.avatarOwnerURL {
            eventHandler?.getImage(forUrl: avatarUrl, completion: { (image) in
                if cell.id == aRepoItem.id {
                    cell.repoOwnerAvatar?.image = image
                }
            })
        }
        return cell
    }
    
}


extension ShowRepoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.isActive = false
        if let repoItem = repoItems?[indexPath.row] {
            handleTap(repoItem)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension ShowRepoViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text,
            searchText.count > 0 {
            debugPrint("Info: trying search repos with: \(searchText)")
            searchController.isActive = false
            startSearch(searchText)
        }
    }
}


// UI setup
extension ShowRepoViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = appColor
        navigationController?.navigationBar.barStyle = .black
    }
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search GitHub"
        searchController.searchBar.barTintColor = appColor
        searchController.searchBar.backgroundColor = appColor
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.white
        searchController.dimsBackgroundDuringPresentation = false
        tableView?.tableHeaderView = searchController.searchBar
    }
    
    @IBAction func loginButtonPressed(_ sender: UIBarButtonItem) {
        showMyRepos()
    }
}
