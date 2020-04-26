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
        
    }
    
    @IBAction func signUpClick(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController else {
            return
        }
        
        present(nextVC, animated: true)
    }
}
