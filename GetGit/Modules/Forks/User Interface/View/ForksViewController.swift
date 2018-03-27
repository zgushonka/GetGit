//
//  ForksViewController.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import UIKit

let appColor = UIColor(red: 74.0/255, green: 98.0/255, blue: 214.0/255, alpha: 1.0)

class ForksViewController: UIViewController {
    var eventHandler : ForksModuleInterface? // presenter
    var forks: [PresentableFork]?
    var repoName: String?
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
}


// actions from presenter
extension ForksViewController: ForksViewInterface {
    func show(forks: [PresentableFork]) {
        self.forks = forks
        tableView?.reloadData()
    }
    
    func show(repoName: String) {
        self.repoName = repoName
        navigationItem.title = repoName
    }
}


extension ForksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forks?.count ?? 0 // "no items" cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RepoItemTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return forkItemCell(tableView, cellForRowAt: indexPath)
    }
    
    private func forkItemCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ForkItemTableViewCell") as? ForkItemTableViewCell else {
            return UITableViewCell()
        }
        
        guard indexPath.row < forks?.count ?? 0,
            let aForkItem = forks?[indexPath.row] else {
                return cell
        }
        
        cell.id = aForkItem.ownerId
        cell.loginLabel?.text = aForkItem.ownerLogin
        
        // fetch owner avatar
        if let avatarUrl = aForkItem.avatarOwnerURL {
            eventHandler?.getImage(forUrl: avatarUrl, completion: { (image) in
                if cell.id == aForkItem.ownerId {
                    cell.repoOwnerAvatar?.image = image
                }
            })
        }
        return cell
    }
    
}


// UI setup
extension ForksViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = appColor
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = repoName
    }
}
