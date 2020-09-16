//
//  DataBaseManager.swift
//  RealmDatabase
//
//  Created by Mac on 16/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import RealmSwift
protocol DataBaseManagerDelegate {
    func didFailWithError(_ dataBaseManager: DataBaseManager, error: String?)
}
class DataBaseManager{
    static var shareInastance = DataBaseManager()
    var realm = try! Realm()
    var delegate : DataBaseManagerDelegate?
    
    
    func saveData(_ object: Student) {
        try! realm.write{
            realm.add(object)
            self.delegate?.didFailWithError(self, error: "Data Saved Successfully")
        }
    }
    
    func daraRetrive() -> [Student] {
        let students = realm.objects(Student.self)
        return Array(students)
    }
}
