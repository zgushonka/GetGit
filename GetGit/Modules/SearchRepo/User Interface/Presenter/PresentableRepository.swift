//
//  PresentableRepositoryItem.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/15/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

struct PresentableRepository {
    var id: Int
    var name: String
    var avatarOwnerURL: String?
    var description: String
    var watchersCount: Int
    var forksCount: Int = 0
    var forksUrl: String?
    
    init(repoItem: Repository) {
        id = repoItem.id ?? 0
        name = repoItem.name ?? "no name"
        avatarOwnerURL = repoItem.owner.avatarURL
        description = repoItem.description ?? "no description"
        watchersCount = repoItem.watchersCount ?? 0
        forksCount = repoItem.forksCount ?? 0
        forksUrl = repoItem.forksUrl
    }
}


extension Repository {
    var presentableRepository: PresentableRepository {
        return PresentableRepository(repoItem: self)
    }
}
