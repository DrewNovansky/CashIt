//
//  Stores.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation

struct Stores: Identifiable {
    
    var id = UUID()
    let storeName: String
    let storePhone: String
    let storeWA: String
    let storeLogo: String
    let storeAddress: String
    var isOpen: Bool
    var storeRating: Int
    let currency: [Currency]
    let review: [Reviews]
    let operationHour: [OperationalHours]

}
