//
//  MyReposParameters.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/16/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

struct MyReposParameters {
    static func make(token: String) -> [String:Any] {
        return ["access_token": token]
    }
}

