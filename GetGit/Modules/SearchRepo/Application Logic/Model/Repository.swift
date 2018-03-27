//
//  GitResultItem.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

struct Repository {
    var id: Int?
    var name: String?
    var description: String?
    var watchersCount: Int?
    var forksCount: Int?
    var forksUrl: String?
    var owner: Owner
}


// add ability to make RepositoryItem from GitRepo
extension GitRepo {
    var repository: Repository {
        return Repository(
            id: id,
            name: name,
            description: description,
            watchersCount: watchersCount,
            forksCount: forks,
            forksUrl: forksUrl,
            owner: Owner(id: owner?.id,
                         avatarURL: owner?.avatarUrl,
                         login: owner?.login))
    }
}
