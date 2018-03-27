//
//  ForksPresenter.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class ForksPresenter {
    weak var view: ForksViewInterface?
    var interactor: ForksInteractorInput?
    var wireframe: ForksWireframe?
    var imageProvdier: ImageProvider?
}


extension ForksPresenter: ForksInteractorOutput {
    func foundRepos(_ repositories: [Repository]) {
        let presentableForks = repositories.map { $0.presentableFork }
        view?.show(forks: presentableForks)
    }
    
    func set(originRepoName: String) {
        view?.show(repoName: originRepoName)
    }
}


extension ForksPresenter: ForksModuleInterface {
    func getImage(forUrl url: String, completion: @escaping (UIImage)->() ) {
        imageProvdier?.getImage(forUrl: url) { (image) in
            completion(image)
        }
    }
}


