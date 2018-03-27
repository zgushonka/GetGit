//
//  ImageProvider.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/16/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import UIKit

protocol ImageProvider {
    func getImage(forUrl url: String, completion: @escaping (UIImage)->() )
}
