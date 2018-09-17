//
//  Utils.swift
//  ChuckNorris
//
//  Created by Caique on 15/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

var imageCache = NSCache<AnyObject, UIImage>()

class Utils {
    static func downloadImage(url: URL, callback: @escaping(Data?, String?) -> Void) {
        Alamofire.request(url.absoluteString, parameters: nil, headers: nil).responseJSON { response in
            if let result = response.data{
                callback(result, nil)
            }else {
                callback(nil, response.result.error.debugDescription)
            }
        }
    }
    static func loadImage(url: URL, callback: @escaping(UIImage?, String?) -> Void) {
        if let image = imageCache.object(forKey: url.absoluteString as AnyObject) {
            callback(image, nil)
        } else {
            downloadImage(url: url) { (data, error) in
                guard error == nil,
                    let image = UIImage(data: data!) else {
                    callback(nil, "Erro ao carregar a imagem")
                    return
                }
                imageCache.setObject(image, forKey: url.absoluteString as AnyObject)
                return callback(image, nil)
            }
        }
        
    }
}
