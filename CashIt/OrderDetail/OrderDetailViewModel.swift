//
//  OrderDetailViewModel.swift
//  CashIt
//
//  Created by Sherwin Yang on 08/12/20.
//

import Foundation

class OrderDetailViewModel: ObservableObject {
    
    var appointment: Appointment
    // Dummy Data
    init() {
        self.appointment = Appointment(moneyChangerName: "", address: "", orderNumber: "7-01-2021-1", status: "Waiting", date: "7-01-2021", time: "18:00", toReceiveAmount: 1400000, toReceiveCurrencyName: "IDR", toExchangeAmount: 100, toExchangeCurrencyName: "USD")
        
    }
}
