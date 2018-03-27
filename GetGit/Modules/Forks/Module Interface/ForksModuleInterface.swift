//
//  ForksModuleInterface.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import UIKit

protocol ForksModuleInterface {
    func getImage(forUrl url: String, completion: @escaping (UIImage)->() )
}
