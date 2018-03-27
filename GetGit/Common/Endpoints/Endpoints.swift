//
//  Endpoints.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/15/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

struct Endpoints {
    enum Git: String {
        case searchRepos = "/search/repositories"
        case myRepos = "/user/repos"
        
        private var base: String {
            return "https://api.github.com"
        }
        
        var url: String {
            return base + self.rawValue
        }
    }
}

