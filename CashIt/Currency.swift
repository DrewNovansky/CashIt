//
//  Prices.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation

struct Currency: Identifiable {
    
    var id = UUID()
    let priceName: String
    let priceBuy: Int
    let priceSell: Int
    
}
