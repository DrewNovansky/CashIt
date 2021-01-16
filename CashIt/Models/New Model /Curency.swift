//
//  Curency.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct Currency:Identifiable {
    var id = UUID()
    var currencyName: String
    var buyPrice: Float
    var sellPrice: Float
}
