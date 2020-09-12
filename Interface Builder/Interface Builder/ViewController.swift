//
//  ViewController.swift
//  Interface Builder
//
//  Created by Mac on 11/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataPassing {
    
    @IBOutlet weak var dataText : UITextField!
    @IBOutlet weak var dataLabel1 : UILabel!
  
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        dataText.text = ""
    }
    
    @IBAction func dataPass(_ sender: UIButton){
        let vC2 = self.storyboard?.instantiateViewController(identifier: "ViewController2") as! ViewController2
        vC2.dataPassed = dataText.text ?? ""
        vC2.deleagte = self
        self.navigationController?.pushViewController(vC2, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VCToVC1" {
            let vc1 = segue.destination as! ViewController1
            vc1.data = dataText.text ?? ""
            vc1.callback = {
                name in self.dataLabel1.text = name
            }
        }
    }
    
    func sendData(data: String) {
        dataLabel1?.text = data
    }

}

