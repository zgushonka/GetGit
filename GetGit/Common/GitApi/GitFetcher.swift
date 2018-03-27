//
//  GitFetcher.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import Alamofire

class GitFetcher {
    
    func fetchRepos(_ searchString: String, completion: @escaping ([GitRepo]?, Error?)->() ) {
        let url = Endpoints.Git.searchRepos.url
        let parameters: Parameters = SearchRepoParameters.make(query: searchString, sort: .stars, order: nil)
        fetchRepos(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, completion: { gitRepos, error in
            completion(gitRepos, error)
        })
    }
    
    func fetchForks(_ forksUrl: String, completion: @escaping ([GitRepo]?, Error?)->() ) {
        fetchRepos(forksUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, completion: { gitRepos, error in
            completion(gitRepos, error)
        })
    }
    
    func fetchMyRepos(_ tonken: String, completion: @escaping ([GitRepo]?, Error?)->() ) {
        let url = Endpoints.Git.myRepos.url
        let parameters: Parameters = MyReposParameters.make(token: tonken)
        fetchRepos(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, completion: { gitRepos, error in
            completion(gitRepos, error)
        })
    }
    
    private func fetchRepos(_ url: URLConvertible,
                            method: HTTPMethod = .get,
                            parameters: Parameters? = nil,
                            encoding: ParameterEncoding = URLEncoding.default,
                            headers: HTTPHeaders? = nil,
                            completion: @escaping ([GitRepo]?, Error?)->() ) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let error = response.error {
                completion(nil, error)
                return
            }
            
            if let json = response.result.value as? [String:Any] {
                let result = GitRepoSearchResult(JSON: json)
                completion(result?.repos, nil)
            } else
                if let json = response.result.value as? [[String:Any]] {
                    var result: [GitRepo] = []
                    for jsonItem in json {
                        if let gitRepo = GitRepo(JSON: jsonItem) {
                            result.append(gitRepo)
                        }
                    }
                    completion(result, nil)
                }
                else {
                    debugPrint("Warning: wrong response.")
                    debugPrint(response)
            }
        }
    }
    
}
