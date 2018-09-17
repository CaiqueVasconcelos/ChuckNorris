//
//  BaseRequest.swift
//  ChuckNorris
//
//  Created by Caique on 14/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import UIKit

class BaseRequest {
    var endpoint: String = ""
    var headers: [String: String] = [:]
    var body: [String : Any] = [:]
    
    required init() {}
}
