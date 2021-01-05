//
//  MoneyViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation

class MCProfileViewModel{
    var currency: [Currency] = []
    var review = ReviewViewModel()
    
    var name : String = "Maju Jaya Money Changer"
    var wa : String = "089633732603"
    
    // Dummy Data
    init() {
        self.currency.append(contentsOf: [
            Currency(priceName: "USD", priceBuy: 14165, priceSell: 14195),
            Currency(priceName: "SGD", priceBuy: 10601, priceSell: 10632),
            Currency(priceName: "THB", priceBuy: 467, priceSell: 475),
            Currency(priceName: "JPY", priceBuy: 135, priceSell: 138),
            Currency(priceName: "KRW", priceBuy: 14150, priceSell: 14180)
        ])
    }
    
    func getPrices(index: Int) -> Currency {
        return currency[index]
    }
}
