//
//  MoneyChanger.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct MoneyChanger: Codable, Identifiable, Hashable {
    var id = UUID()
    var moneyChangerId: Int
    var moneyChangerName: String
    var photo: String
    var address: String
    var whatsappLink: String
    var phoneNumber: String
    var latitudeCoordinate: Double
    var longitudeCoordinate: Double
    
    enum CodingKeys: String, CodingKey {
        case moneyChangerId = "id"
        case moneyChangerName = "name"
        case photo = "photo"
        case address = "address"
        case whatsappLink = "whatsAppLink"
        case phoneNumber = "phoneNumber"
        case latitudeCoordinate = "latitudeCoordinate"
        case longitudeCoordinate = "longitudeCoordinate"
    }
}
