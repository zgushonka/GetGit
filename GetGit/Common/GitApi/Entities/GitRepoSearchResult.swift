//
//  GitRepoSearchResult.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/15/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import ObjectMapper

struct GitRepoSearchResult: Mappable {
    var incompleteResults: Bool?
    var repos: [GitRepo]?
    var totalCount: Int?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        incompleteResults <- map["incomplete_results"]
        repos <- map["items"]
        totalCount <- map["total_count"]
    }
}
