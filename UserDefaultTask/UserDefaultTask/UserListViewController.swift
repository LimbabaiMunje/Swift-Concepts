//
//  UserListViewController.swift
//  UserDefaultTask
//
//  Created by Mac on 15/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {
    // MARK:- Properties
    
    @IBOutlet weak var tableView: UITableView!
    var userarray = [[String:String]]()
    
    // MARK:- ViewController lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(navigateToSave))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        userarray = []
        if let user = UserDefaults.standard.object(forKey: "UserData") as? [String:String]{
            userarray.append(user)
            tableView.reloadData()
        }
    }
    
    // MARK:- Navigation
    @objc func navigateToSave(){
        let saveVC = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(saveVC, animated: true)
    }
    
}
//MARK:- TableViewDElegate Methods
extension UserListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

//MARK:- TableViewDataSourc Methods
extension UserListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
        let user = userarray[indexPath.row]
        cell.nameLabel.text = user["userName"]
        cell.addressLabel.text = user["userAddress"]
        cell.emailLabel.text = user["userEmail"]
        
        return cell
    }
}
