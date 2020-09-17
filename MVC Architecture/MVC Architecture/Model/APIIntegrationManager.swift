//
//  APIIntegrationManager.swift
//  Web-Services(API)
//
//  Created by Mac on 16/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
protocol APIIntergrationManagerDelegate {
    //MARK:- Protocol
    func didFailWithError(_ apiIntergrationManager: APIIntergrationManager, error: String?)
}

class APIIntergrationManager {
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    var delegate : APIIntergrationManagerDelegate?
    var vc : ViewController?
    static var shareInstance = APIIntergrationManager()
    var userList = [DataModel]()
    var comp : (([String:Any])->())?
    
    //MARK:- GET API Call
    func performURLRequest()
    {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) {[self] (data, response, error) in
            if error != nil{
                self.delegate?.didFailWithError(self, error: error?.localizedDescription)
                return
            }
            guard let safeData = data else{
                self.delegate?.didFailWithError(self, error: error?.localizedDescription)
                return
            }
            do{
                let users = try JSONDecoder().decode([DataModel].self, from: safeData)
//                print(users)
                DispatchQueue.main.async {
                    for user in users{
                        let userData = DataModel(userId: user.userId ?? 0, id: user.id ?? 0, title: user.title ?? "", body: user.body ?? "")
                        self.userList.append(userData)
                        self.vc?.tableView.reloadData()
//                        print(self.userList)
                    }
                }
            }
            catch{
                self.delegate?.didFailWithError(self, error: error.localizedDescription)
            }
        }.resume()
    }
    
    func performPostURLRequest(_ userData: DataModel) {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts"){
            let parameter = DataModel(userId: userData.userId ?? 0, id: userData.id ?? 0, title: userData.title ?? "", body: userData.body ?? "")
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = try? JSONEncoder().encode(parameter)
            let task = URLSession.shared.dataTask(with: request) { (read, response, error) in
                if let data = read
                {
                    do
                    {
                        let jsonResponse = try JSONDecoder().decode(DataModel.self, from: data)
                        self.delegate?.didFailWithError(self, error: "You have posted new user with id = \(jsonResponse.id ?? 0)")
                    }
                    catch
                    {
                        self.delegate?.didFailWithError(self, error: error.localizedDescription)
                    }
                }
            }
            task.resume()
        }
    }
}
