//
//  ViewController.swift
//  Web-Services(API)
//
//  Created by Mac on 16/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var usersData = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "User Information"
        APIIntergrationManager.shareInstance.delegate = self
        APIIntergrationManager.shareInstance.vc = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        APIIntergrationManager.shareInstance.performURLRequest()
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APIIntergrationManager.shareInstance.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
        let user = APIIntergrationManager.shareInstance.userList[indexPath.row]
        print(user)
        cell.userId?.text = "\(user.id ?? 0)"
        cell.title?.text = user.title
        return cell
    }
}

extension ViewController : APIIntergrationManagerDelegate{
    //MARK:- Error Handling
    func didFailWithError(_ apiIntergrationManager: APIIntergrationManager, error: String?) {
         DispatchQueue.main.async {
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
}
