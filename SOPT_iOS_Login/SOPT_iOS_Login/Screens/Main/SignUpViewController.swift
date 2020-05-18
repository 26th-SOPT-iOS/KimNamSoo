//
//  SignUpViewController.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/04/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    let service: LoginServiceProtocol = LoginServiceImp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        // 네비게이션 백버튼 텍스트 삭제
        navigationController?.navigationBar.backItem?.title = ""
        // 네비게이션 하단밑줄 제거
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func signUpCompleteClick(_ sender: Any) {
        
        guard idTextField.hasText ||
            pwTextField.hasText ||
            nameTextField.hasText ||
            emailTextField.hasText ||
            phoneTextField.hasText else {
                
                let alert = UIAlertController(title: nil, message: "빈칸을 채워주세요", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Cancel", style: .cancel)
                alert.addAction(cancel)
                present(alert, animated: true)
                return
        }
        let form = SignUpForm(id: idTextField.text, pw: pwTextField.text, name: nameTextField.text, email: emailTextField.text, phone: phoneTextField.text)
        
        service.requestSignUp(form: form)
        
    }
}
