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
    
    let service: LoginServiceProtocol = LoginServiceImp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isAutoLogin()
        setNavigationColor()
        signUpLabel.underLine()
        setupCheckBox()
    }
    
    func isAutoLogin() {
        if UserDefaults.standard.bool(forKey: UserDefaultName.isAutoLogin.rawValue) {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBarC") else {
                return
            }
            present(nextVC, animated: true)
        }
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

        guard emailTextField.hasText &&
            pwTextField.hasText else {
                return
        }
        
        guard let id = emailTextField.text,
            let pw = pwTextField.text else {
                return
        }
        let isAutoLogin = autoLoginButton.isSelected
        service.requestLogin(id: id, pw: pw) { result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let token):
                    if isAutoLogin {
                        UserDefaults.standard.set(true, forKey: UserDefaultName.isAutoLogin.rawValue)
                    }
                    print(token)
                    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBarC") else {
                        return
                    }
                    self.present(nextVC, animated: true)
                case .failed(let err):
                    print(err)
                    self.simpleAlert(title: "로그인 실패", msg: "아이디와 비번을 다시 확인해주세요.")
                }
            }
        }
    }
    
    @IBAction func signUpClick(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpViewController else {
            return
        }
        nextVC.service = service
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func autoLoginClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? autoCheckAnimation() : autoUnCheckAnimation()
    }
}
