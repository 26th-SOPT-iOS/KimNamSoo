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
    var mockData: [MockType] = [] {
        willSet {
            friendTableView.reloadData()
        }
    }
    lazy var myImg = UIImage(named: "myImg")
    
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
    
    func generateActionSheet() {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let managerAction = UIAlertAction(title: "친구관리", style: .default, handler: nil)
        let setAllAction = UIAlertAction(title: "전체설정", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    
        sheet.addAction(managerAction)
        sheet.addAction(setAllAction)
        sheet.addAction(cancel)
        
        present(sheet, animated: true)
    }
    
    @IBAction func settingClick(_ sender: Any) {
        generateActionSheet()
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "잘가시츄..") { (action, view, success ) in
            self.mockData.remove(at: indexPath.row)
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        let underLine = UIView()
        underLine.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        let profileImg = setupProfileImgView()
        let nickLabel = setupNickLabel()
        
        view.addSubview(underLine)
        view.addSubview(profileImg)
        view.addSubview(nickLabel)
        
        nickLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        underLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImg.widthAnchor.constraint(equalToConstant: 60),
            profileImg.heightAnchor.constraint(equalToConstant: 60),
            profileImg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nickLabel.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 13),
            nickLabel.centerYAnchor.constraint(equalTo: profileImg.centerYAnchor),
            underLine.heightAnchor.constraint(equalToConstant: 0.5),
            underLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            underLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            underLine.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }
    
    func setupProfileImgView() -> UIImageView {
        let imgView = UIImageView()
        imgView.image = myImg
        imgView.contentMode = .scaleAspectFill
        return imgView
    }
    
    func setupNickLabel() -> UILabel {
        let label = UILabel()
        label.text = "김남수"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = #colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.1529411765, alpha: 1)
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 88
    }
}

