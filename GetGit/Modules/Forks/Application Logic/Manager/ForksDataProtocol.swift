//
//  ForksDataProtocol.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation

protocol ForksDataProtocol {
    func fetchForks(withUrl url: String, completion: @escaping ([Repository]?, Error?)->() )
}
