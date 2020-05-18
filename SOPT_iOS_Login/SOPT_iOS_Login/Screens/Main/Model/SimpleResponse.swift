//
//  SimpleResponse.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

struct SimpleResponse<T: Codable>: Codable {
    let status: Int?
    let success: Bool?
    let message: String?
    let data: T?
    
    enum CodingKeys: CodingKey {
        case status, success, message, data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? nil
        success = (try? values.decode(Bool.self, forKey: .success)) ?? nil
        message = (try? values.decode(String.self, forKey: .message)) ?? nil
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}
