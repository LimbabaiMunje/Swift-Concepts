//
//  DatabaseManager.swift
//  CoreData
//
//  Created by Mac on 14/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import CoreData
import UIKit
protocol DataBaseManagerDelegate {
    func didFailWithError(_ dataBaseManager: DatabaseManager, error: String?)
}
class DatabaseManager {
    static var shareInstance = DatabaseManager()
    var delegate : DataBaseManagerDelegate?
    let contex = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object: DatabaseModel)  {
        let student = NSEntityDescription.insertNewObject(forEntityName: "StudentDatabase", into: contex!) as! StudentDatabase
        student.name = object.name
        student.address = object.address
        student.branch = object.branch
        student.mobNo = object.mobileNo
        student.result = object.result
        student.rollNo = object.rollNo
        
        do{
            try contex?.save()
        }
        catch{
            self.delegate?.didFailWithError(self, error: error.localizedDescription)
        }
    }
    func getStudentData() -> [StudentDatabase] {
        var student = [StudentDatabase]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StudentDatabase")
        do{
            student = try contex?.fetch(fetchRequest) as! [StudentDatabase]
        }
        catch{
            self.delegate?.didFailWithError(self, error: error.localizedDescription)
        }
        return student
    }
    func deleteData(indexPath: Int) -> [StudentDatabase] {
        var student = getStudentData()
        contex?.delete(student[indexPath])
        student.remove(at: indexPath)
        do {
            try contex?.save()
        }
        catch{
            self.delegate?.didFailWithError(self, error: error.localizedDescription)
        }
        return student
    }
    
    func editData(object: DatabaseModel, index: Int)  {
        let student = getStudentData()
        student[index].name = object.name
        student[index].address = object.address
        student[index].branch = object.branch
        student[index].mobNo = object.mobileNo
        student[index].result = object.result
        student[index].rollNo = object.rollNo
        do {
            try contex?.save()
        }
        catch{
            self.delegate?.didFailWithError(self, error: error.localizedDescription)
        }
    }
}
