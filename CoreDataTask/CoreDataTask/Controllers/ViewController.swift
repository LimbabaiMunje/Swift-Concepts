//
//  ViewController.swift
//  CoreDataTask
//
//  Created by Mac on 14/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var students = [StudentDatabase]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(navigateToSave))
        DatabaseManager.shareInstance.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        students = DatabaseManager.shareInstance.getStudentData()
        tableView.reloadData()
    }
    @objc func navigateToSave(){
        let saveVC = self.storyboard?.instantiateViewController(identifier: "SaveDataViewController") as! SaveDataViewController
        self.navigationController?.pushViewController(saveVC, animated: true)
    }
}
//MARK: - TableViewDelegate Methods
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            students = DatabaseManager.shareInstance.deleteData(indexPath: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let saveVC = self.storyboard?.instantiateViewController(identifier: "SaveDataViewController") as! SaveDataViewController
        let dict = DatabaseModel(address: students[indexPath.row].address, branch: students[indexPath.row].branch, name: students[indexPath.row].name, result: students[indexPath.row].result, rollNo: students[indexPath.row].rollNo, mobileNo: students[indexPath.row].mobNo)
        saveVC.data = dict
        saveVC.indexValue = indexPath.row
        saveVC.isUpdate = true
        self.navigationController?.pushViewController(saveVC, animated: true)
    }
}

//MARK: - TableViewDataSource Methods
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(students.count)
        return students.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StudentTableViewCell
        let student = students[indexPath.row]
        cell.textLabel?.text = student.name
        return cell
    }
}
//MARK:- Error Handling

extension ViewController: DataBaseManagerDelegate{
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
