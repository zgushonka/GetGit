//
//  RepoItemTableViewCell.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/15/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import UIKit

class RepoItemTableViewCell: UITableViewCell {
    
    static let height: CGFloat = 138.0
    
    var id: Int?
    @IBOutlet weak var repoOwnerAvatar: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    
    @IBOutlet weak var forksCountLabel: UILabel?
    @IBOutlet weak var watchersCountLabel: UILabel?

    override func prepareForReuse() {
        id = nil
        repoOwnerAvatar?.image = nil
    }
    
}
