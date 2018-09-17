//
//  PiadasServices.swift
//  ChuckNorris
//
//  Created by Caique on 14/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import UIKit
import Alamofire

protocol PiadasServicesProtocol: class {
    func buscaCategorias(callback: @escaping ([String]?, String?) -> Void)
    func buscaPiada(categoria: String, callback: @escaping (Piada?, String?) -> Void)
}

class PiadasServices: PiadasServicesProtocol {
    func buscaCategorias(callback: @escaping ([String]?, String?) -> Void) {
        let request = BuscaCategoriasRequest()
        Alamofire.request(request.endpoint,
                          parameters: request.body,
                          headers: request.headers).responseJSON { response in
                            
            if let result = response.result.value as? [String]{
                callback(result, nil)
            }else {
                callback(nil, response.result.error.debugDescription)
            }
        }
    }
    func buscaPiada(categoria: String, callback: @escaping (Piada?, String?) -> Void) {
        let request = PiadaRequest(categoria: categoria)
        Alamofire.request(request.endpoint,
                          parameters: request.body,
                          headers: request.headers).responseJSON { response in
                            
            if let res = response.result.value as? [String: Any] ,
                let result = Piada(JSON: res){
                callback(result, nil)
            }else {
                callback(nil, response.result.error.debugDescription)
            }
        }
    }
}
