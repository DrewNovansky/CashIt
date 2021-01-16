//
//  Appointment.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct Appointment:Identifiable {
    var id = UUID()
    var orderNumber: String
    var status: String
    var date: String
    var time: String
    var toExchangeAmount: Int
}
