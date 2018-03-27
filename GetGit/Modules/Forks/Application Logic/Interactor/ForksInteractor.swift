//
//  ForksInteractor.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

class ForksInteractor: ForksInteractorInput {
    weak var output: ForksInteractorOutput? { // presenter
        didSet {
            fetchForks(forksUrl)
            output?.set(originRepoName: originRepoName)
        }
    }
    private let dataManager: ForksDataProtocol?
    
    private let originRepoName: String
    private let forksUrl: String
    
    init(repoName: String, forksUrl: String, dataManager: ForksDataProtocol) {
        self.dataManager = dataManager
        self.originRepoName = repoName
        self.forksUrl = forksUrl
    }
    
    func fetchForks(_ url: String) {
        dataManager?.fetchForks(withUrl: url) { repoItems, error in
            guard error == nil else {
                debugPrint("Error: " + error!.localizedDescription)
                return
            }
            
            guard let repoItems = repoItems else {
                debugPrint("Warning: no repos from response.")
                return
            }
            // send data to the presenter
            self.output?.foundRepos(repoItems)
        }
    }
}
