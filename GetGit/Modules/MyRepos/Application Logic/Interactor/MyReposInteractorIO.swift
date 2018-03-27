//
//  MyReposInteractorIO.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation


protocol MyReposInteractorInput {
    func fetchMyRepos()
}

protocol MyReposInteractorOutput: AnyObject {
    func foundRepos(_ repositories: [Repository])
}

