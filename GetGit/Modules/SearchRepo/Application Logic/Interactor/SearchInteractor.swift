//
//  SearchInteractor.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

class SearchInteractor: SearchInteractorInput {
    weak var output: SearchInteractorOutput? // presenter
    private let dataManager: SearchDataProtocol?
    
    init(dataManager: SearchDataProtocol) {
        self.dataManager = dataManager
    }
    
    func searchGit(_ searchText: String) {
        // do the search
        dataManager?.fetchRepos(withName: searchText, completion: { repoItems, error in
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
