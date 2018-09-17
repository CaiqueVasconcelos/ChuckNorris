//
//  ListaCategoriasPiadasViewController.swift
//  ChuckNorris
//
//  Created by Caique on 13/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import UIKit

class ListaCategoriasPiadasViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var piadasViewModel: PiadasViewModel!
    
    var lista: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        piadasViewModel = PiadasViewModel()
        setup()
    }
    
    func setup() {
        self.showLoading()
        piadasViewModel.buscaCategorias(callback: { (response) in
            self.showLoading()
            guard response == nil else {
                self.showMessage(buttonTitle: "OK", message: response!)
                return
            }
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PiadaDetalheViewController {
            vc.piadaViewModel = self.piadasViewModel
        }
    }

}
extension ListaCategoriasPiadasViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return piadasViewModel!.categorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell")else {
            return UITableViewCell()
        }
        cell.textLabel?.text = piadasViewModel!.categorias[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        piadasViewModel.set(index: indexPath.row)
        self.performSegue(withIdentifier: "showPiada", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}
