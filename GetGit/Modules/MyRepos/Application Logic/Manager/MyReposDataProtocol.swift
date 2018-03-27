//
//  MyReposDataProtocol.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

protocol MyReposDataProtocol {
    func fetchMyRepos(withToken token: String, completion: @escaping ([Repository]?, Error?)->() )
}
