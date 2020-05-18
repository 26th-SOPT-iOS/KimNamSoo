//
//  UIView+Extension.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    open override func awakeFromNib() {
        super.awakeFromNib()
        // UIView의 tag가 1인경우 둥글게
        if self.tag == 1{
            self.layer.cornerRadius = self.frame.height/2
        }
    }
}
