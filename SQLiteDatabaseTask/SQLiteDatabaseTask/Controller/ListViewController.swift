//
//  ListViewController.swift
//  SQLiteDatabaseTask
//
//  Created by Mac on 15/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var tableView : UITableView!
    var employee = DatabaseManager.shareInstance
    var employees = [EmployeeDataModel]()
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        employee.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(navigateToSave))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    //MARK: - Navigation
    @objc func navigateToSave(){
        let saveVC = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(saveVC, animated: true)
    }
}

//MARK: - TableViewDelegate Methods
extension ListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            DatabaseManager.shareInstance.deleteData(self.employees[indexPath.row])
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editVC = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        editVC.employeeData = employees[indexPath.row]
        print(employees[indexPath.row])
        editVC.isUpdate = true
        self.navigationController?.pushViewController(editVC, animated: true)
    }
}
//MARK:- Error Handling

extension ListViewController: DataBaseManagerDelegate{
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

//MARK: - TableViewDataSource Methods
extension ListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.selectdata().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
        employees = employee.selectdata()
        let employeeData = employees[indexPath.row]
        cell.textLabel?.text = employeeData.empName
        cell.detailTextLabel?.text = employeeData.empAddress
        return cell
    }
}
