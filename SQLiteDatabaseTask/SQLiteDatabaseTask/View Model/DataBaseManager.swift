//
//  DataBaseManager.swift
//  SqliteTask
//
//  Created by Mac on 15/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import SQLite3

protocol DataBaseManagerDelegate {
    func didFailWithError(_ dataBaseManager: DatabaseManager, error: String?)
}

class DatabaseManager{
    static var shareInstance = DatabaseManager()
    var delegate : DataBaseManagerDelegate?
    var employees = [EmployeeDataModel]()
    var listVC : ListViewController?
    
    //MARK: - Create DataBse
    func createdatabase()
    {
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbpath = url.appendingPathComponent("Employee.sqlite")
        let f = FileManager()
        if f.fileExists(atPath: dbpath.path)
        {
            self.delegate?.didFailWithError(self, error: "Database already present")
        }
        else
        {
            var ptr : OpaquePointer?
            if sqlite3_open(dbpath.path, &ptr) == SQLITE_OK
            {
                let query="create table employees(empid integer primary key,empname varchar(20),empaddress varchar(20),empContact varchar(20),empEmail varchar(20))"
                if sqlite3_exec(ptr, query, nil, nil, nil) == SQLITE_OK
                {
                    self.delegate?.didFailWithError(self, error: "table created successfully")
                }
                else
                {
                    self.delegate?.didFailWithError(self, error: "fail to crete table")
                }
            }
            else
            {
                self.delegate?.didFailWithError(self, error: "fail to open database")
            }
            sqlite3_close(ptr)
        }
    }
    
    //MARK: -  InsertData
    func insertData(_ object: EmployeeDataModel){
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbpath = url.appendingPathComponent("Employee.sqlite")
        var ptr : OpaquePointer?
        if sqlite3_open(dbpath.path, &ptr) == SQLITE_OK
        {
            let query = "insert into employees values(\(object.empID),'\(object.empName)','\(object.empAddress)','\(object.empContact)','\(object.empEmail)')"
            print(query)
            if sqlite3_exec(ptr, query, nil, nil, nil) == SQLITE_OK
            {
                self.delegate?.didFailWithError(self, error: "Record inserted")
            }
            else
            {
                self.delegate?.didFailWithError(self, error: "fail to insert")
            }
        }
        else
        {
            self.delegate?.didFailWithError(self, error: "fail to open database in insert function")
        }
        sqlite3_close(ptr)
        self.listVC?.tableView.reloadData()
    }
    
    //MARK: - Update Data
    func updataData(_ object: EmployeeDataModel) {
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbpath = url.appendingPathComponent("Employee.sqlite")
        var ptr : OpaquePointer?
        if sqlite3_open(dbpath.path, &ptr) == SQLITE_OK
        {
            let query = "update employees set empname='\(object.empName)',empaddress='\(object.empAddress)',empContact='\(object.empContact)', empEmail='\(object.empEmail)' where empid=\(object.empID)"
            if sqlite3_exec(ptr, query, nil, nil, nil) == SQLITE_OK
            {
                self.delegate?.didFailWithError(self, error: "Record updated")
            }
            else
            {
                self.delegate?.didFailWithError(self, error: "Fail to updated")
            }
        }
        else
        {
            self.delegate?.didFailWithError(self, error: "fail to open database in update function")
        }
        sqlite3_close(ptr)
    }
    
    //MARK: - Delete Data
    func deleteData(_ object: EmployeeDataModel)  {
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbpath = url.appendingPathComponent("Employee.sqlite")
        var ptr:OpaquePointer?
        if sqlite3_open(dbpath.path, &ptr) == SQLITE_OK
        {
            let query="delete from employees where empid=\(object.empID)"
            if sqlite3_exec(ptr, query, nil, nil, nil)==SQLITE_OK
            {
                self.delegate?.didFailWithError(self, error: "Record deleted")
            }
            else
            {
                self.delegate?.didFailWithError(self, error: "Fail to Delete")
            }
        }
        else
        {
            self.delegate?.didFailWithError(self, error: "fail to open database in delete function")
        }
        sqlite3_close(ptr)
        self.listVC?.tableView.reloadData()
        
    }
    
    //MARK: - Select Data
    func selectdata() -> [EmployeeDataModel]{
        employees = []
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbpath = url.appendingPathComponent("Employee.sqlite")
        var ptr : OpaquePointer?
        var result : OpaquePointer?
        if sqlite3_open(dbpath.path, &ptr) == SQLITE_OK
        {
            let query = "select * from employees"
            if sqlite3_prepare(ptr, query, -1, &result, nil) == SQLITE_OK
            {
                while sqlite3_step(result) == SQLITE_ROW
                {
                    let empID = sqlite3_column_int(result, 0)
                    let empName = String.init(format:" %s",sqlite3_column_text(result, 1))
                    let empAddress = String.init(format:" %s",sqlite3_column_text(result, 2))
                    let empContact = String.init(format:" %s",sqlite3_column_text(result, 3))
                    let empEmail = String.init(format:" %s",sqlite3_column_text(result, 4))
                    let employee = EmployeeDataModel(empID: Int(empID), empName: empName, empEmail: empEmail, empContact: empContact, empAddress: empAddress)
                    employees.append(employee)
                    self.listVC?.tableView.reloadData()
                }
            }
            else
            {
                self.delegate?.didFailWithError(self, error: "Fail to Select")
            }
        }
        else
        {
            self.delegate?.didFailWithError(self, error: "fail to open database in select function")
        }
        sqlite3_close(ptr)
        return employees
    }
}

