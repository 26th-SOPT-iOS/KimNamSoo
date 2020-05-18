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
    func requestSignUp(form: SignUpForm, completion: @escaping (DataResponseType<HttpStatusCode>) -> Void) {
        
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
                    guard let code = response.value?.status,
                        let httpCode = HttpStatusCode(rawValue: code) else {
                            completion(.failed(NSError(domain: "StatusCode Err", code: 0, userInfo: nil)))
                            return
                    }
                    completion(.success(httpCode))
                case .failure(let err):
                    print(err)
                    completion(.failed(err))
                }
        }
    }
}
