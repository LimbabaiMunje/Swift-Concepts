//
//  SaveAndEditViewController.swift
//  RealmDatabase
//
//  Created by Mac on 16/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class SaveAndEditViewController: UIViewController {
    //MARK:- Properties
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var branch: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var organization: UITextField!
    var student = Student()
    
    //MARK:- SaveData
    @IBAction func saveData(_ sender: UIButton){
        student.address = address.text
        student.name = name.text
        student.branch = branch.text
        student.organization = organization.text
        DataBaseManager.shareInastance.saveData(student)
        
    }
}
//MARK:- DataBaseManagerDelegate
extension SaveAndEditViewController: DataBaseManagerDelegate{
    func didFailWithError(_ dataBaseManager: DataBaseManager, error: String?) {
        
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
