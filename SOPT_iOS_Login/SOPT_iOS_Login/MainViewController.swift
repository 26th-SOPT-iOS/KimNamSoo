//
//  ViewController.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/04/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func loginClick(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController else {
            return
        }
        
        present(nextVC, animated: true)
    }
    
    @IBAction func signUpClick(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpViewController else {
            return
        }
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
}




extension UIButton {
    open override func awakeFromNib() {
        super.awakeFromNib()
        // UIButton의 tag가 1인경우 둥글게
        if self.tag == 1{
            self.layer.cornerRadius = self.frame.height/2
        }
    }
}
