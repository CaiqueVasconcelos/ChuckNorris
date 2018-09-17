//
//  PiadaDetalheViewController.swift
//  ChuckNorris
//
//  Created by Caique on 14/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import UIKit

class PiadaDetalheViewController: BaseViewController {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lblPiada: UILabel!
    @IBOutlet weak var btnLink: UIButton!
    
    internal var piadaViewModel: PiadasViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup(){
        self.showLoading()
        piadaViewModel.buscaPiada(callback: { (response) in
            guard response == nil,
                    let piada = self.piadaViewModel.getPiada() else {
                        self.showLoading()
                self.showMessage(buttonTitle: "OK", message: response!)
                return
            }
            DispatchQueue.main.async {
                self.lblPiada.text = piada.value
                let linkTitle = "Categoria: " + self.piadaViewModel.categoria!
                self.btnLink.setTitle(linkTitle, for: .normal)
                if let image = self.piadaViewModel.getImage() {
                    self.icon.image =  image
                }
//                imageCache.object(forKey: <#T##AnyObject#>)
                self.showLoading()
            }
        })
    }
    
    @IBAction func tappedOpenLink(_ sender: Any) {
        guard let url = URL(string:(piadaViewModel.piada?.url)!) else {
            let alert = UIAlertController(title: "Erro", message: "Ocorreu um erro", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            return
        }
        UIApplication.shared.openURL(url)
    }
    
}
