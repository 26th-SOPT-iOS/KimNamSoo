//
//  baseURL.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation


class BaseURL {
    private init() { }
    static let shared = BaseURL()
    private let baseURLString = "http://13.209.144.115:3333"
    
    func getBaseString() -> String {
        return baseURLString
    }
}
