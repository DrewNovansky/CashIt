//
//  Curency.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct Currency: Decodable,Identifiable {
    var id = UUID()
    var currencyName: String
    var buyPrice: Float
    var sellPrice: Float
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case currencyName = "day"
        case buyPrice = "buyPrice"
        case sellPrice = "sellPrice"
    }
}
