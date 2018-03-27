//
//  SearchDataManager.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

class SearchDataManager: SearchDataProtocol {
    let gitFetcher: GitFetcher?
    
    init(gitFetcher: GitFetcher) {
        self.gitFetcher = gitFetcher
    }
    
    func fetchRepos(withName searchText: String, completion: @escaping ([Repository]?, Error?) -> ()) {
        GitFetcher().fetchRepos(searchText) { repos, error in
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
