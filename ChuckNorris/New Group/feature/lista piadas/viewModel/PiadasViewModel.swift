//
//  PiadasViewModel.swift
//  ChuckNorris
//
//  Created by Caique on 14/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import UIKit
import Alamofire

class PiadasViewModel: NSObject {
    
    internal lazy var service: PiadasServicesProtocol = PiadasServices()
    
    internal var categorias: [String]
    internal var categoria: String?
    internal var piada: Piada?
    internal var imageData: UIImage?
    
    override init() {
        categorias = []
        categoria = ""
    }
}
extension PiadasViewModel {
    public func set(index: Int) {
        self.categoria = categorias[index]
    }
    public func set(piada: Piada) {
        self.piada = piada
    }
    public func getCategorias() -> [String?] {
        return self.categorias
    }
    public func getPiada() -> Piada? {
        return self.piada
    }
    public func getImage() -> UIImage? {
        return self.imageData
    }
}
// MARK: Serviços
extension PiadasViewModel {
    public func buscaCategorias(callback: @escaping (String?) -> Void) {
        service.buscaCategorias { (categorias, response) in
            guard let result = categorias, response == nil else {
                let erro = response ?? "Ocorreu um erro"
                callback(erro)
                return
            }
            self.categorias = result
            callback(nil)
        }
    }
    public func buscaPiada(callback: @escaping (String?) -> Void) {
        service.buscaPiada(categoria: self.categoria!) { (piada, response) in
            guard let result = piada, response == nil else {
                let erro = response ?? "Ocorreu um erro"
                callback(erro)
                return
            }
            self.set(piada: result)
            self.checkImage(callback: callback)
        }
    }
}
// MARK: Functions
extension PiadasViewModel {
    internal func checkImage(callback: @escaping (String?) -> Void){
        guard let url = URL(string: piada!.icon_url!) else {
            callback("Erro ao carregar a imagem")
            return
        }
        Utils.loadImage(url: url ) { (image, errorMessage) in
            guard errorMessage == nil else {
                let erro = errorMessage ?? "Erro ao carregar a imagem"
                callback(erro)
                return
            }
            self.imageData = image
            callback(nil)
        }
    }
}
