//
//  StudentDatabase+CoreDataProperties.swift
//  CoreDataTask
//
//  Created by Mac on 14/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//
//

import Foundation
import CoreData


extension StudentDatabase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentDatabase> {
        return NSFetchRequest<StudentDatabase>(entityName: "StudentDatabase")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var mobNo: String?
    @NSManaged public var branch: String?
    @NSManaged public var rollNo: String?
    @NSManaged public var result: String?

}
