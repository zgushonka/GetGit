//
//  ForksWireframe.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import UIKit

class ForksWireframe {
    func createViewFromStoryboard() -> ForksViewController? {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ForksViewController.self)) as? ForksViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
