//
//  OrderDetailViewModel.swift
//  CashIt
//
//  Created by Sherwin Yang on 08/12/20.
//

import Foundation

class OrderDetailViewModel: ObservableObject {
    
//    init(_ transaction: Transaction) {
//        self.transaction = transaction
//    }
    
    var name : String = "Maju Jaya Money Changer"
    var address: String = "Jl. Doang Jadian Kaga Blok AQ No.4, Rawa Belong, Jakarta Barat, 11270"
    var orderID: String = "1101202102"
    var date: String = "11 Januari 2021"
    var time: String = "16:00"
    var fromName: String = "IDR"
    var fromTotal: Int = 1000000
    var toName: String = "USD"
    var toTotal: Int =  70
    
    var transaction: Transaction = Transaction(orderNumber: "", date: "", moneyChangerName: "", moneyChangerAddress: "", time: "", amount: "")
    
    
}
