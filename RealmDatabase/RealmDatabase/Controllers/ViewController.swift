//
//  ViewController.swift
//  RealmDatabase
//
//  Created by Mac on 15/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {
    //MARK:- Properties
    @IBOutlet weak var tableView : UITableView!
    var students = [Student]()
    
    //MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Student Information"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigation))
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        students = DataBaseManager.shareInastance.daraRetrive()
        tableView.reloadData()
    }
    
    //MARK:- Navigation
    @objc func navigation(){
        let saveAndEditVC = self.storyboard?.instantiateViewController(identifier: "SaveAndEditViewController") as! SaveAndEditViewController
        self.navigationController?.pushViewController(saveAndEditVC, animated: true)
    }
}

//MARK:- TableViewDataSource methods
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StudentTableViewCell
        let student = students[indexPath.row]
        cell.textLabel?.text = student.name
        cell.detailTextLabel?.text = student.organization
        
        return cell
    }
}

//MARK:- DataBaseManagerDelegate
extension ViewController: DataBaseManagerDelegate{
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
