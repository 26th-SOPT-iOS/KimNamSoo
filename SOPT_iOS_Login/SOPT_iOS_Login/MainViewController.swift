//
//  ViewController.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/04/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    setNavigationColor()
        signUpLabel.underLine()
    }
    
    func setNavigationColor() {
        // 네비게이션 영역 그라데이션색
        // navigationController?.navigationBar.backgroundColor = .red
        // 툴바 버튼색
        navigationController?.navigationBar.tintColor = .blue
        // 네비게이션 영역색
        navigationController?.navigationBar.barTintColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func loginClick(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "ScrollVC") as? ScrollViewController else {
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

extension UIView {
    open override func awakeFromNib() {
        super.awakeFromNib()
        // UIView의 tag가 1인경우 둥글게
        if self.tag == 1{
            self.layer.cornerRadius = self.frame.height/2
        }
    }
}
