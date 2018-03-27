//
//  FetchForksParameters.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/15/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

struct FetchForksParameters {
    static func make(sort: ForksSort) -> [String:Any] {
        return sort.dict
    }
}


enum ForksSort: String {
    case newest
    case oldest
    case stargazers
    
    var dict: [String:Any] {
        return ["sort" : self.rawValue]
    }
}
