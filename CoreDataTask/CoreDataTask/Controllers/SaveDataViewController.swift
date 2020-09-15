//
//  SaveDataViewController.swift
//  CoreData
//
//  Created by Mac on 14/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class SaveDataViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var mobileNoText: UITextField!
    @IBOutlet weak var rollNoText: UITextField!
    @IBOutlet weak var branchText: UITextField!
    @IBOutlet weak var resultText: UITextField!
    var data = DatabaseModel()
    var indexValue = 0
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameText?.text = data.name
        addressText?.text = data.address
        mobileNoText?.text = data.mobileNo
        resultText?.text = data.result
        rollNoText?.text = data.rollNo
        branchText?.text = data.branch
        
    }
    
    @IBAction func saveDataOnclick(_ sender: UIButton){
        
        let student = DatabaseModel(address: addressText.text ?? "", branch: branchText.text ?? "", name: nameText.text ?? "", result: resultText.text ?? "", rollNo: rollNoText.text ?? "", mobileNo: mobileNoText.text ?? "")
        if isUpdate {
            DatabaseManager.shareInstance.editData(object: student, index: indexValue)
        }
        else{
            DatabaseManager.shareInstance.save(object: student)
        }
    }
    
    @IBAction func backButton(_ sender: UIButton){
    
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- Error Handling

extension SaveDataViewController: DataBaseManagerDelegate{
    func didFailWithError(_ dataBaseManager: DatabaseManager, error: String?) {
        let alert = UIAlertController(title: "Oops!",
                                      message: error,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Close",
                                         style: .default,
                                         handler: nil)
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        
    }
}
 

