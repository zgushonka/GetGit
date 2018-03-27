//
//  SearchWireframe.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import UIKit

class SearchWireframe {
    func presentForksInterface(withDetails repoDetails: (name: String, forksUrl: String)) {
        if let forksVC = AppDependencies.assembleForksModule(repoDetails: repoDetails),
            let navigationVC = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationVC.pushViewController(forksVC, animated: true)
        } else {
            debugPrint("Warning: failed to present Forks module.")
        }
    }
    
    func createViewFromStoryboard() -> ShowRepoViewController? {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ShowRepoViewController.self)) as? ShowRepoViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    func presentMyReposInterface() {
        if let myReposVC = AppDependencies.assembleMyReposModule(),
            let navigationVC = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationVC.pushViewController(myReposVC, animated: true)
        } else {
            debugPrint("Warning: failed to present MyRepos module.")
        }
    }
}
