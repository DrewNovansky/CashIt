//
//  OfficeHour.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct OfficeHour:Identifiable {
    var id = UUID()
    var day: String
    var openTime: String
    var closeTime: String
}
