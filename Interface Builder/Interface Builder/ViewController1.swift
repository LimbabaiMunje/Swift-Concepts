//
//  ViewController1.swift
//  Interface Builder
//
//  Created by Mac on 11/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
 
    @IBOutlet weak var dataLabel : UILabel!
    @IBOutlet weak var nameField : UITextField!
    var data = ""
    var callback:((String?)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel?.text = "Welcome dear \(data)"
    }
    //MARK: - Closure Method
    @IBAction func dataBack(_ sender: UIButton) {
        callback?(nameField.text)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
