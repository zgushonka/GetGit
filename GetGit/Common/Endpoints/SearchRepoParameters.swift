//
//  SearchRepoParameters.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/15/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

struct SearchRepoParameters {
    static func make(query: String, sort: RepoSort?, order: RepoOrder?) -> [String:Any] {
        var parameters: [String:Any] = ["q": query]
        parameters.update(other: sort?.dict)
        parameters.update(other: order?.dict)
        return parameters
    }
}


enum RepoSort: String {
    case stars
    case forks
    case updated
    
    var dict: [String:Any] {
        return ["sort" : self.rawValue]
    }
}

enum RepoOrder: String {
    case asc
    case desc
    
    var dict: [String:Any] {
        return ["order" : self.rawValue]
    }
}


extension Dictionary {
    mutating func update(other: Dictionary?) {
        guard let other = other else { return }
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

