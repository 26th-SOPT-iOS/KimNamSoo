//
//  LoginServiceProtocol.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

protocol LoginServiceProtocol {
    func requestSignUp(form: SignUpForm, completion: @escaping (DataResponseType<HttpStatusCode>) -> Void)
    
    func requestLogin(id: String, pw: String, completion: @escaping (DataResponseType<String>) -> Void)
}

