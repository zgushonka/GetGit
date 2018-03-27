//
//  MyReposViewController.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import UIKit

//let appColor = UIColor(red: 74.0/255, green: 98.0/255, blue: 214.0/255, alpha: 1.0)

class MyReposViewController: UIViewController {
    var eventHandler : MyReposModuleInterface? // presenter
    var repoItems: [PresentableRepository]?
    
    @IBOutlet weak var tableView: UITableView?
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler?.updateData()
        setupNavBar()
    }
    
    private func handleTap(_ repoItem: PresentableRepository) {
        eventHandler?.showDetails(forRepo: repoItem)
    }
    
    private func logout() {
        
    }
}


// actions from presenter
extension MyReposViewController: MyReposViewInterface {
    func showNoContentMessage() {
        repoItems = nil
        updateView()
    }
    
    func showRepositories(_ repoItems: [PresentableRepository]) {
        self.repoItems = repoItems
        updateView()
    }
    
    private func updateView() {
        tableView?.reloadData()
    }
}


extension MyReposViewController: UITableViewDataSource {
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


extension MyReposViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.isActive = false
        if let repoItem = repoItems?[indexPath.row] {
            handleTap(repoItem)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// UI setup
extension MyReposViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = appColor
        navigationController?.navigationBar.barStyle = .black
    }
}
