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
    var service: LoginServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        // 네비게이션 백버튼 텍스트 삭제
        navigationController?.navigationBar.backItem?.title = ""
        // 네비게이션 하단밑줄 제거
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func signUpCompleteClick(_ sender: Any) {
        
        guard idTextField.hasText &&
            pwTextField.hasText &&
            nameTextField.hasText &&
            emailTextField.hasText &&
            phoneTextField.hasText else {
                simpleAlert(title: nil, msg: "빈칸을 채워주세요")
                return
        }
        let form = SignUpForm(id: idTextField.text, pw: pwTextField.text, name: nameTextField.text, email: emailTextField.text, phone: phoneTextField.text)
        
        service.requestSignUp(form: form) { result in
            switch result {
            case .success(let statusCode):
                DispatchQueue.main.async {
                    switch statusCode {
                    case .existId:
                        self.simpleAlert(title: "이미 아이디가 존재합니다.", msg: nil)
                    case .success:
                        self.simpleAlert(title: "회원 가입 성공", msg: nil)
                    case .serverError:
                        self.simpleAlert(title: "서버오류", msg: nil)
                    default:
                        break
                    }
                }
            case .failed(let err):
                print(err)
            }
        }
        
    }
}
