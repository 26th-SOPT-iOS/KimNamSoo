//
//  UIViewController.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func simpleAlert(title: String?, msg: String?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        alert.modalPresentationStyle = .fullScreen
        present(alert, animated: true)
    }
}
