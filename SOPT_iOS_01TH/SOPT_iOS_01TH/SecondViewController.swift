//
//  SecondViewController.swift
//  SOPT_iOS_01TH
//
//  Created by 남수김 on 2020/04/18.
//  Copyright © 2020 ns. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    
    var name: String?
    var email: String?
    var isOnOff: Bool?
    var sliderValue: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabels()
    }
    
    func setLabels() {
        guard let name = name,
            let email = email,
            let isOnOff = isOnOff,
            let sliderValue = sliderValue else {
                return
        }
        
        nameLabel.text = name
        emailLabel.text = email
        switchLabel.text = isOnOff ? "On" : "Off"
        sliderLabel.text = String(sliderValue)
    }
    
    @IBAction func backClick(_ sender: Any) {
        dismiss(animated: true)
    }
}

