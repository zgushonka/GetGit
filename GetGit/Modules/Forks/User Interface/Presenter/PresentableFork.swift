//
//  PresentableFork.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/16/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

struct PresentableFork {
    var repoName: String
    var ownerId: Int
    var avatarOwnerURL: String?
    var ownerLogin: String
    
    init(repoItem: Repository) {
        repoName = repoItem.name ?? "no name"
        ownerId = repoItem.owner.id ?? 0
        avatarOwnerURL = repoItem.owner.avatarURL
        ownerLogin = repoItem.owner.login ?? "no login"
    }
}


extension Repository {
    var presentableFork: PresentableFork {
        return PresentableFork(repoItem: self)
    }
}
