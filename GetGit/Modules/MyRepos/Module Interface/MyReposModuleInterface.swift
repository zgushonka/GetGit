//
//  MyReposModuleInterface.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/16/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import UIKit

protocol MyReposModuleInterface {
    func updateData()
    func showDetails(forRepo repoItem: PresentableRepository)
    func getImage(forUrl url: String, completion: @escaping (UIImage)->() )
}
