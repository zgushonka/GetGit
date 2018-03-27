//
//  ForksDataManager.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

class ForksDataManager: ForksDataProtocol {
    let gitFetcher: GitFetcher?
    
    init(gitFetcher: GitFetcher) {
        self.gitFetcher = gitFetcher
    }
    
    func fetchForks(withUrl url: String, completion: @escaping ([Repository]?, Error?)->() ) {
        GitFetcher().fetchForks(url) { repos, error in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            
            if let repos = repos {
                let repoItems = repos.map { $0.repository }
                completion(repoItems, nil)
            } else {
                completion(nil, nil)
            }
        }
    }
}
