//
//  ViewController.swift
//  SOPT_iOS_01TH
//
//  Created by 남수김 on 2020/04/18.
//  Copyright © 2020 ns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextClick(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else {
            return
        }
        
        nextVC.name = nameTextField.text
        nextVC.email = emailTextField.text
        nextVC.isOnOff = mySwitch.isOn
        nextVC.sliderValue = mySlider.value
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
}
