//
//  Annotations.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 06/01/21.
//

import Foundation

struct Annotations : Identifiable,Hashable,Decodable {
    var id = UUID()
    let storeName: String
    let storeLatitude: Double
    let storeLongitude: Double
    let storeAddress: String
}
