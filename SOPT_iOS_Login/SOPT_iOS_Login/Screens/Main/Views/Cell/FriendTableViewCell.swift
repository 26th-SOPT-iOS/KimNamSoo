//
//  FriendTableViewCell.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/12.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    static let reuseIdentifier = "FriendCell"
    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var profilImgView: UIImageView!
    
    var model: MockFriend? {
        willSet {
            profilImgView.image = newValue?.profilImg
            nickNameLabel.text = newValue?.nickName
            descriptLabel.text = newValue?.descript
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
