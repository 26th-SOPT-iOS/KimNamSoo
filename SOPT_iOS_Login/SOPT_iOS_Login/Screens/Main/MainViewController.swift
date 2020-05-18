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
    @IBOutlet weak var autoLoginCheckBox: UIView!
    @IBOutlet weak var autoLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationColor()
        signUpLabel.underLine()
        setupCheckBox()
    }
    
    func setNavigationColor() {
        // 툴바 버튼색
        navigationController?.navigationBar.tintColor = .blue
        // 네비게이션 영역색
        navigationController?.navigationBar.barTintColor = .white
    }
    
    func setupCheckBox() {
        autoLoginCheckBox.layer.borderColor = UIColor.lightGray.cgColor
        autoLoginCheckBox.layer.borderWidth = 1
    }
    
    func autoCheckAnimation() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [.allowUserInteraction, .curveLinear], animations: {
            self.autoLoginCheckBox.backgroundColor = #colorLiteral(red: 0.5901310444, green: 0.4440979362, blue: 1, alpha: 1)
            self.autoLoginCheckBox.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        })
    }
    
    func autoUnCheckAnimation() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [.allowUserInteraction, .curveLinear], animations: {
            self.autoLoginCheckBox.backgroundColor = .white
            self.autoLoginCheckBox.transform = .identity
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func loginClick(_ sender: Any) {
        let isAutoLogin = autoLoginButton.isSelected
        
        if isAutoLogin {
            UserDefaults.standard.set(true, forKey: UserDefaultName.isAutoLogin.rawValue)
        }
        
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "TabBarC") else {
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
    
    @IBAction func autoLoginClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? autoCheckAnimation() : autoUnCheckAnimation()
    }
}
