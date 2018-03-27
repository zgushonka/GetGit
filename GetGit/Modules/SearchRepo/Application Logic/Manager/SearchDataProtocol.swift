//
//  SearchDataProtocol.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

protocol SearchDataProtocol {
    func fetchRepos(withName searchText: String, completion: @escaping ([Repository]?, Error?)->() )
}
