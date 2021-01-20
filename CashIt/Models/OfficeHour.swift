//
//  OfficeHour.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct OfficeHour: Decodable,Identifiable {
    var id = UUID()
    var day: String
    var openTime: String
    var closeTime: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case day = "day"
        case openTime = "openTime"
        case closeTime = "closeTime"
    }
}
