//
//  Piada.swift
//  ChuckNorris
//
//  Created by Caique on 14/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import UIKit
import ObjectMapper

class Piada: Mappable {
    var icon_url: String?
    var id: String?
    var url: String?
    var value: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        icon_url <- map["icon_url"]
        id <- map["id"]
        url <- map["url"]
        value <- map["value"]
    }
}
