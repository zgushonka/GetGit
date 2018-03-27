//
//  ForksViewInterface.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

protocol ForksViewInterface: AnyObject {
    func show(forks: [PresentableFork])
    func show(repoName: String)
}

