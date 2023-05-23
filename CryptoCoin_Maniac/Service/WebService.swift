//
//  WebService.swift
//  CryptoCoin_Maniac
//
//  Created by Rodrigo Telles on 22/05/23.
//

import Foundation
// Sessão para adquirir dados da web e decodificar JSON
class WebService {
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}
