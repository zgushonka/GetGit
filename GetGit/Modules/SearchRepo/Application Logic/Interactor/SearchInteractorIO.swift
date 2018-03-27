//
//  SearchInteractorIO.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation


protocol SearchInteractorInput {
    func searchGit(_ searchText: String)
}

protocol SearchInteractorOutput: AnyObject {
    func foundRepos(_ repositories: [Repository])
}

