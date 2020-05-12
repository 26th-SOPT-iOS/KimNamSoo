//
//  FriendViewController.swift
//  SOPT_iOS_Login
//
//  Created by 남수김 on 2020/05/12.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {

    @IBOutlet weak var friendTableView: UITableView!
    var mockData: [MockType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSampleData()
        friendTableView.dataSource = self
        friendTableView.delegate = self
    }
    
    func fetchSampleData() {
        mockData = MockFriendList(num: 4).data
        let headerData = MockHeader(type: .header, friendNum: mockData.count)
        mockData.insert(headerData, at: 0)
    }
}

extension FriendViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellData = mockData[indexPath.row]
        switch cellData.type {
        case .header:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.reuseIdentifier, for: indexPath) as? HeaderTableViewCell else {
                break
            }
            cell.friendNum = mockData.count
            return cell
        case .friend:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.reuseIdentifier, for: indexPath) as? FriendTableViewCell else {
                break
            }
            cell.model = cellData as? MockFriend
            return cell
        default:
            break
        }
        
        return UITableViewCell(style: .default, reuseIdentifier: "")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellData = mockData[indexPath.row]
        switch cellData.type {
        case .header:
            return 38
        case .friend:
            return 60
        default:
            return 0
        }
    }
}

