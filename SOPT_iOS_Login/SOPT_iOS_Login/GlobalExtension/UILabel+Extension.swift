//
//  UILabel+Extension.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/04/27.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func underLine() {
        guard let text = self.text else {
            return
        }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.underlineStyle, value: 1, range: (text as NSString).range(of: text))
        
        self.attributedText = attributedString
    }
}
