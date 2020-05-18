//
//  SignUpForm.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

struct SignUpForm {
    let id: String?
    let pw: String?
    let name: String?
    let email: String?
    let phone: String?
    
    init(id: String?, pw: String?, name: String?, email: String?, phone: String?) {
        self.id = id
        self.pw = pw
        self.name = name
        self.email = email
        self.phone = phone
    }
}
