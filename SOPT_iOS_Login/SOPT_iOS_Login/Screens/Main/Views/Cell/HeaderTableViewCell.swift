//
//  HeaderTableViewCell.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/12.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    static let reuseIdentifier = "HeaderCell"
    @IBOutlet weak var friendCountLabel: UILabel!
    
    var friendNum: Int = 0 {
        willSet {
            friendCountLabel.text = "친구 \(newValue)"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
