//
//  LoginServiceImp.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import Alamofire

struct LoginServiceImp: LoginServiceProtocol {
    func requestSignUp(form: SignUpForm) {
        
        var urlComponent = URLComponents(string: BaseURL.shared.getBaseString())
        urlComponent?.path = RequestURL.signUp.getURLString
        
        guard let url = urlComponent?.url else {
            return
        }
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        let body: Parameters = [
            "id": form.id!,
            "password": form.pw!,
            "name": form.name!,
            "email": form.email!,
            "phone": form.phone!
        ]
        
        let request = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        request
            .validate(statusCode: 200..<500)
            .responseDecodable(of: SimpleResponse<String>.self) { response in
                print("--response")
                
                switch response.result {
                case .success:
                    print(response.value)
                    print(response.value?.message)
                case .failure(let err):
                    print(err)
                }
        }
    }
}
