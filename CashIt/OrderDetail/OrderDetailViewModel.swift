//
//  OrderDetailViewModel.swift
//  CashIt
//
//  Created by Sherwin Yang on 08/12/20.
//

import Foundation

class OrderDetailViewModel: ObservableObject {
//    var review: Appointment
//    var moneyChanger: MoneyChanger
    
//    init() {
//
//    }
    
    var appointment: Appointment
    var moneyChanger: MoneyChanger
    // Dummy Data
    init() {
        self.moneyChanger = MoneyChanger(moneyChangerName: "Rainbow Bridge Money Changer", photo: "Test", address: "Jl.Raya Kb.Jeruk Gg.H. Salbini No.27 RT.1 RW.9",whatsappLink: "wa.me/6281291286046", phoneNumber: "081291286046",latitudeCoordinate:-6.2018528,longitudeCoordinate: 106.782557)
        self.appointment = Appointment(orderNumber: "7-01-2021-1", status: "Waiting", date: "7-01-2021-1", time: "18:00", toReceiveAmount: 1400000, toReceiveCurrencyName: "IDR", toExchangeAmount: 100, toExchangeCurrencyName: "USD")
    }
    
    var name : String = "Rainbow Bridge Money Changer"
    var address: String = "Jl.Raya Kb.Jeruk Gg.H.Salbini No.27 RT.1 RW.9"
    var orderID: String = "1101202102"
    var date: String = "11 Januari 2021"
    var time: String = "16:00"
    var fromName: String = "IDR"
    var fromTotal: Int = 1000000
    var toName: String = "USD"
    var toTotal: Int =  70
    
    var transaction: Appointment = Appointment(orderNumber: "", status: "", date: "", time: "", toReceiveAmount: 0, toReceiveCurrencyName: "", toExchangeAmount: 0, toExchangeCurrencyName: "")
    

    
}
