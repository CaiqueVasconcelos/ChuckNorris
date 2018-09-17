//
//  PiadaRequest.swift
//  ChuckNorris
//
//  Created by Caique on 14/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import UIKit

class PiadaRequest: BaseRequest {
    required init() {
        super.init()
        endpoint = "https://api.chucknorris.io/jokes/random"
        
    }
    convenience init(categoria: String) {
        self.init()
        
        headers["category"] = categoria
    }
}
