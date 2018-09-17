//
//  BuscaCategorias.swift
//  ChuckNorris
//
//  Created by Caique on 14/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import UIKit
import ObjectMapper

class BuscaCategorias: Mappable {
    var categorias: [String]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        categorias <- map["Array"]
    }
}
