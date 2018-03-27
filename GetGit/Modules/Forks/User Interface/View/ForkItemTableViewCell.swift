//
//  ForkItemTableViewCell.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/15/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import UIKit

class ForkItemTableViewCell: UITableViewCell {
    
    static let height: CGFloat = 102.0
    
    var id: Int?
    @IBOutlet weak var repoOwnerAvatar: UIImageView?
    @IBOutlet weak var loginLabel: UILabel?

    override func prepareForReuse() {
        id = nil
        repoOwnerAvatar?.image = nil
    }
    
}
