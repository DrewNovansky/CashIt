//
//  Store.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation

struct Store : Identifiable,Hashable,Decodable {
    var id = UUID()
    let storeName: String
    let storePrice: Int
    let storeLogo: String
    let storeAddress: String
    let latitude: Double
    let longitude: Double
    var distance: Double
}
