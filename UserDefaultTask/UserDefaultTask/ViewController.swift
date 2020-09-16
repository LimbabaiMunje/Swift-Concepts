//
//  ViewController.swift
//  UserDefaultTask
//
//  Created by Mac on 15/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // MARK:- Properties
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    
     // MARK:- Save Button
    @IBAction func saveOnClick(_ sender: UIButton){
        let user = ["userName": userName.text ?? "", "userAddress": userAddress.text ?? "", "userEmail": userEmail.text ?? ""]
        let defaults = UserDefaults.standard
        defaults.set(user, forKey: "UserData")
        
        userName.text = ""
        userEmail.text = ""
        userAddress.text = ""
    }    
}

