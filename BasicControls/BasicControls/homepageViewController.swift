//
//  homepageViewController.swift
//  uikitdemo
//
//  Created by Mac on 02/03/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class homepageViewController: UIViewController {

    @IBOutlet weak var welcomelable: UILabel!
    var tempValue:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomelable.text="Welcome"+" "+tempValue!
        
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
