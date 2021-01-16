//
//  StoreViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 02/01/21.
//

import Foundation

class StoreViewModel {
    
    var stores : [MoneyChanger] = []
    var money = MCProfileViewModel()
    var review = ReviewViewModel()
    var operationalHour = InfoViewModel()
    init() {
        self.stores.append(contentsOf: [
//            MoneyChanger(storeName: "Bambang", storePhone: "09123", storeWA: "linktree", storeLogo: "iamge", storeAddress: "address", isOpen: true, storeRating: review.getStoreRating(), currency: money.currency, review: review.reviews, operationHour: operationalHour.operationalHours)
        ])
    }
    
}
