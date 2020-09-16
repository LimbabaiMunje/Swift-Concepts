//
//  Student.swift
//  RealmDatabase
//
//  Created by Mac on 16/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import RealmSwift

class Student : Object {
    @objc dynamic var name: String?
    @objc dynamic  var address: String?
    @objc dynamic  var branch: String?
    @objc dynamic  var organization: String?
    
}
