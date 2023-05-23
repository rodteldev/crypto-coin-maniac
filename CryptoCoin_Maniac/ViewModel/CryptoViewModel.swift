//
//  CryptoViewModel.swift
//  CryptoCoin_Maniac
//
//  Created by Rodrigo Telles on 22/05/23.
//

import Foundation
//Structs e arrays para as moedas
struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}
