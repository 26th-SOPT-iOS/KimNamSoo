//
//  HttpStatusCode.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

enum HttpStatusCode: Int, Error {
    
    case success = 204
    case existId = 200
    case requestError = 400
    case failure = 404
    case serverError = 500
    
}
