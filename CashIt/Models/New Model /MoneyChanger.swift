//
//  MoneyChanger.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct MoneyChanger: Identifiable,Hashable,Decodable {
    var id = UUID()
    var moneyChangerName: String
    var photo: String
    var address: String
    var whatsappLink: String
    var phoneNumber: String
    var latitudeCoordinate: Double
    var longitudeCoordinate: Double
    var distance: Double
}
