//
//  SearchViewInterface.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

protocol SearchViewInterface: AnyObject {
    func updateContent()
    func showNoContentMessage()
    func showRepositories(_ repoItems: [PresentableRepository])
}

