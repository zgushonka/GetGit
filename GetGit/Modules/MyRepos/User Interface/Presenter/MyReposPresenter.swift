//
//  MyReposPresenter.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class MyReposPresenter {
    weak var view: MyReposViewInterface?
    var interactor: MyReposInteractorInput?
    var wireframe: MyReposWireframe?
    var imageProvdier: ImageProvider?
}


extension MyReposPresenter: MyReposInteractorOutput {
    func foundRepos(_ repositories: [Repository]) {
        let presentableRepoItems = repositories.map { $0.presentableRepository }
        if presentableRepoItems.isEmpty {
            view?.showNoContentMessage()
        } else {
            view?.showRepositories(presentableRepoItems)
        }
    }
}


extension MyReposPresenter: MyReposModuleInterface {
    func updateData() {
        interactor?.fetchMyRepos()
    }
    
    func getImage(forUrl url: String, completion: @escaping (UIImage)->() ) {
        imageProvdier?.getImage(forUrl: url) { image in
            completion(image)
        }
    }
    
    func showDetails(forRepo repoItem: PresentableRepository) {
        if repoItem.forksCount > 0,
            let forksUrl = repoItem.forksUrl {
            wireframe?.presentForksInterface(withDetails: (repoItem.name, forksUrl))
        }
    }
}

