//
//  SearchPresenter.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class SearchPresenter {
    weak var view: SearchViewInterface?
    var interactor: SearchInteractorInput?
    var wireframe: SearchWireframe?
    var imageProvdier: ImageProvider?
}


extension SearchPresenter: SearchInteractorOutput {
    func foundRepos(_ repositories: [Repository]) {
        let presentableRepoItems = repositories.map { $0.presentableRepository }
        if presentableRepoItems.isEmpty {
            view?.showNoContentMessage()
        } else {
            view?.showRepositories(presentableRepoItems)
        }
    }
}


extension SearchPresenter: SearchModuleInterface {    
    func getImage(forUrl url: String, completion: @escaping (UIImage)->() ) {
        imageProvdier?.getImage(forUrl: url) { image in
            completion(image)
        }
    }
    
    func searchRepo(withString searchText: String) {
        interactor?.searchGit(searchText)
    }
    
    func showDetails(forRepo repoItem: PresentableRepository) {
        if repoItem.forksCount > 0,
            let forksUrl = repoItem.forksUrl {
            wireframe?.presentForksInterface(withDetails: (repoItem.name, forksUrl))
        }
    }
    
    func showMyRepos() {
        let oauth = GitHubOAuth.shared
        if oauth.isAuthorized == true {
            wireframe?.presentMyReposInterface()
        } else {
            oauth.doOAuthGithub() { [weak self] in
                self?.view?.updateContent()
            }
        }
    }
    
    func showMyReposButtonTitle() -> String {
        return GitHubOAuth.shared.isAuthorized ? "My Repos" : "Login"
    }
}

