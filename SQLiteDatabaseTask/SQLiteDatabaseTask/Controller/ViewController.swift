//
//  ViewController.swift
//  SQLiteDatabaseTask
//
//  Created by Mac on 15/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var empID: UITextField!
    @IBOutlet weak var empName: UITextField!
    @IBOutlet weak var empAddress: UITextField!
    @IBOutlet weak var empEmail: UITextField!
    @IBOutlet weak var empContact: UITextField!
    var employeeData : EmployeeDataModel?
    var isUpdate = Bool()
    
    //MARK: - UserInterface Update
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DatabaseManager.shareInstance.delegate = self
        empID?.text = "\(employeeData?.empID ?? 0)"
        empName?.text = employeeData?.empName
        empAddress?.text = employeeData?.empAddress
        empEmail?.text = employeeData?.empEmail
        empContact?.text = employeeData?.empContact
    }
    
    //MARK: - Save and Edit Function
    @IBAction func saveButtonClick(_ sender: UIButton){
        if isUpdate{
            guard let idText = empID.text, let id = Int(idText) else {
                return
            }
            let employee = EmployeeDataModel(empID: id, empName: empName.text ?? "", empEmail: empEmail.text ?? "", empContact: empContact.text ?? "", empAddress: empAddress.text ?? "")
            DatabaseManager.shareInstance.updataData(employee)
        }
        else{
            guard let idText = empID.text, let id = Int(idText) else {
                return
            }
            let employee = EmployeeDataModel(empID: id, empName: empName.text ?? "", empEmail: empEmail.text ?? "", empContact: empContact.text ?? "", empAddress: empAddress.text ?? "")
            DatabaseManager.shareInstance.insertData(employee)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK:- Error Handling

extension ViewController: DataBaseManagerDelegate{
    func didFailWithError(_ dataBaseManager: DatabaseManager, error: String?) {
        let alert = UIAlertController(title: "Hello",
                                      message: error,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Close",
                                         style: .default,
                                         handler: nil)
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        
    }
}
