//
//  Appointment.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct Appointment: Decodable,Identifiable{
    var id = UUID()
    var moneyChangerId: Int
    var moneyChangerName: String
    var address: String
    var orderNumber: String
    var status: String
    var date: String
    var time: String
    var toReceiveAmount: Int
    var toReceiveCurrencyName: String
    var toExchangeAmount: Int
    var toExchangeCurrencyName: String
    
    enum CodingKeys: String,CodingKey {
        case moneyChangerId = "moneyChangerId"
        case moneyChangerName = "moneyChangerName"
        case address = "moneyChangerAddress"
        case orderNumber = "orderNumber"
        case status = "status"
        case date = "date"
        case time = "time"
        case toReceiveAmount = "toReceiveAmount"
        case toReceiveCurrencyName = "toReceiveCurrencyName"
        case toExchangeAmount = "toExchangeAmount"
        case toExchangeCurrencyName = "toExchangeCurrencyName"
    }
}
