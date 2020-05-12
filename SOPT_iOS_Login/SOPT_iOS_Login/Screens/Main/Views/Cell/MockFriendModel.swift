//
//  MockFriendList.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/12.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import UIKit

enum ChatListType {
    case header, friend, none
}

protocol MockType {
    var type: ChatListType {get}
}

struct MockFriend: MockType {
    var type: ChatListType
    let profilImg: UIImage?
    let nickName: String
    let descript: String
}

struct MockHeader: MockType {
    var type: ChatListType
    let friendNum: Int
}

struct MockFriendList {
    let sampleImg1: UIImage
    let sampleImg2: UIImage
    var data: [MockFriend] = []
    
    init(num: Int) {
        sampleImg1 = UIImage(named: "profile1Img")!
        sampleImg2 = UIImage(named: "profile2Img")!
        data = generateMock(num: num)
    }
    
    func generateMock(num: Int) -> [MockFriend] {
        var array: [MockFriend] = []
        for _ in 0..<num {
            array += [
                MockFriend(type: .friend, profilImg: sampleImg1, nickName: "시츄시츄", descript: "왈! 왈! 왈!"),
                MockFriend(type: .friend, profilImg: sampleImg2, nickName: "시츄시츄", descript: "머! 머! 머!"),
                MockFriend(type: .friend, profilImg: sampleImg1, nickName: "시츄시츄", descript: "뭐! 뭐! 뭐!"),
                MockFriend(type: .friend, profilImg: sampleImg2, nickName: "시츄시츄", descript: "머1! 머! 머!"),
                MockFriend(type: .friend, profilImg: sampleImg1, nickName: "시츄시츄", descript: "머2! 머! 머!"),
                MockFriend(type: .friend, profilImg: sampleImg2, nickName: "시츄시츄", descript: "머3! 머! 머!"),
                MockFriend(type: .friend, profilImg: sampleImg1, nickName: "시츄시츄", descript: "머4! 머! 머!"),
            ]
        }
        return array
    }
}
