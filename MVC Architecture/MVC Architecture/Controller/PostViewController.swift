//
//  PostViewController.swift
//  Web-Services(API)
//
//  Created by Mac on 16/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    //MARK:-Prperties
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var body: UITextField!
    
    var completed = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Post Data"
        
        
        
        
    }
    //MARK:- POST API
    @IBAction func postData(_ sender: UIButton){
        
        guard let idText = id.text, let id = Int(idText) else {
            return
        }
        guard let useridText = userId.text, let useId = Int(useridText) else {
            return
        }
        let data = DataModel(userId: useId, id: id, title: titleText.text ?? "", body: body.text ?? "")
        APIIntergrationManager.shareInstance.performPostURLRequest(data)
    }
}
extension PostViewController : APIIntergrationManagerDelegate{
    //MARK:- Error Handling
    func didFailWithError(_ apiIntergrationManager: APIIntergrationManager, error: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ohh!",
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
