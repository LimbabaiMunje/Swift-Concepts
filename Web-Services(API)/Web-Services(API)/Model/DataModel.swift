//
//  DataModel.swift
//  Web-Services(API)
//
//  Created by Mac on 16/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
struct DataModel : Codable {
    let userId : Int?
    let id : Int?
    let title : String?
    let completed : Bool?

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
    init(userId: Int, id:Int, title: String, completed: Bool){
        self.userId = userId
        self.id =  id
        self.completed = completed
        self.title = title
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        completed = try values.decodeIfPresent(Bool.self, forKey: .completed)
    }

}
