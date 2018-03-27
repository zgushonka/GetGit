//
//  MyReposInteractor.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

class MyReposInteractor: MyReposInteractorInput {
    weak var output: MyReposInteractorOutput? // presenter {
    private let dataManager: MyReposDataProtocol?
    
    init(dataManager: MyReposDataProtocol) {
        self.dataManager = dataManager
    }
    
    func fetchMyRepos() {
        // do the search
        if let token = GitHubOAuth.shared.oauthToken {
            dataManager?.fetchMyRepos(withToken: token, completion: { repoItems, error in
                guard error == nil else {
                    // error handling
                    debugPrint("Error: " + error!.localizedDescription)
                    return
                }
                
                guard let repoItems = repoItems else {
                    debugPrint("Warning: no repos from response.")
                    return
                }
                // send data to the presenter
                self.output?.foundRepos(repoItems)
            })
        }
    }
}
