//
//  LoginViewController.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/04/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var imgViewHeightLayout: NSLayoutConstraint!
    @IBOutlet weak var parallaxImgView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var headerImgHeight: CGFloat = 210
    var minHeaderImgHeight: CGFloat = 108
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    @IBAction func logoutClick(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: UserDefaultName.isAutoLogin.rawValue)
        dismiss(animated: true)
    }
}

extension ScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0.0 {
            // Scrolling down: Scale
            imgViewHeightLayout.constant = headerImgHeight - scrollView.contentOffset.y
        } else {
            // Scrolling up: Parallax
            var height = headerImgHeight - scrollView.contentOffset.y
            height = height > minHeaderImgHeight ? height : minHeaderImgHeight
            imgViewHeightLayout.constant = height
        }
    }
}
