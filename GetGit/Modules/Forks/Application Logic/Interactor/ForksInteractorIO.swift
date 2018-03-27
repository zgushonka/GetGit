//
//  ForksInteractorIO.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation


protocol ForksInteractorInput {
    
}

protocol ForksInteractorOutput: AnyObject {
    func foundRepos(_ repositories: [Repository])
    func set(originRepoName: String)
}

