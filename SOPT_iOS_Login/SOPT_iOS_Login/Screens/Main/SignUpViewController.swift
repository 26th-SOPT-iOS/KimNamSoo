//
//  SignUpViewController.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/04/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        // 네비게이션 백버튼 텍스트 삭제
        navigationController?.navigationBar.backItem?.title = ""
        // 네비게이션 하단밑줄 제거
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func signUpCompleteClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
