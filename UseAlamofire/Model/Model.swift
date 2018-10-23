//
//  User.swift
//  UseAlamofire
//
//  Created by macbook on 10/18/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    
    var userId = Int()
    var id = Int()
    var title = String()
    var body = String()
    
    init(UserJson:JSON) {
        
        self.userId = UserJson["userId"].intValue
        self.id = UserJson["id"].intValue
        self.title = UserJson["title"].stringValue
        self.body = UserJson["body"].stringValue
    }
}

class Images
{
    var albumId = Int()
    var id = Int()
    var title = String()
    var thumbnailUrl = String()
    var url = String()
    
    init(ImageJson : JSON) {
        
        self.albumId = ImageJson["albumId"].intValue
        self.id = ImageJson["id"].intValue
        self.title = ImageJson["title"].stringValue
        self.thumbnailUrl = ImageJson["thumbnailUrl"].stringValue
        self.url = ImageJson["url"].stringValue
    }
}

