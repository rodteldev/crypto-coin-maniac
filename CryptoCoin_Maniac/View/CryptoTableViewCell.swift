//
//  CryptoTableViewCell.swift
//  CryptoCoin_Maniac
//
//  Created by Rodrigo Telles on 22/05/23.
//

import UIKit
// 
class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
