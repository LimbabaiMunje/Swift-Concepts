//
//  ViewController2.swift
//  Interface Builder
//
//  Created by Mac on 12/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
protocol DataPassing {
    func sendData(data: String)
}
class ViewController2: UIViewController {

    @IBOutlet weak var dataThroughSegue : UILabel!
    @IBOutlet weak var textDataBack : UITextField!
    var dataPassed = ""
    var deleagte : DataPassing?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataThroughSegue?.text = "Hello \(dataPassed)"
    }
    
    //MARK: - Protocol and Delegate Method
    @IBAction func dataBack(_ sender: UIButton){
        deleagte?.sendData(data: textDataBack.text ?? "")
        self.navigationController?.popToRootViewController(animated: true)
    }
}
