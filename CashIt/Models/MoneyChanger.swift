//
//  MoneyChanger.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct MoneyChanger: Decodable, Identifiable, Hashable {
    var id = UUID()
    var moneyChangerName: String
    var photo: String
    var address: String
    var whatsappLink: String
    var phoneNumber: String
    var latitudeCoordinate: Double
    var longitudeCoordinate: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case moneyChangerName = "name"
        case photo = "photo"
        case address = "address"
        case whatsappLink = "whatsAppLink"
        case phoneNumber = "phoneNumber"
        case latitudeCoordinate = "latitudeCoordinate"
        case longitudeCoordinate = "longitudeCoordinate"
    }
}
