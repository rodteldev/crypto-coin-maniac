//
//  ViewController.swift
//  CryptoCoin_Maniac
//
//  Created by Rodrigo Telles on 22/05/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var cyptoListViewModel : CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
// Necessário criar uma nova API e um site para adquirir os preços dos cryptocoins
    private func getData() {
        let url = URL(string: "")!
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                self.cyptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData() //recarrega os valores atuais
                }
            }
        }
    }
    //Formatação e disposição da tabela
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cyptoListViewModel == nil ? 0 : self.cyptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cyptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        return cell
    }


}

