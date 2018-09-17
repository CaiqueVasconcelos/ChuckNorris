//
//  BuscaCategoriasRequest.swift
//  ChuckNorris
//
//  Created by Caique on 14/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import UIKit

class BuscaCategoriasRequest: BaseRequest {
    required init() {
        super.init()
        endpoint = "https://api.chucknorris.io/jokes/categories"
    }
}
