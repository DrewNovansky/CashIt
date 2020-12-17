//
//  OrderDetailViewModel.swift
//  CashIt
//
//  Created by Sherwin Yang on 08/12/20.
//

import Foundation

class OrderDetailViewModel {
    init(_ transaction: Transaction) {
        self.transaction = transaction
    }
    var transaction: Transaction = Transaction(orderNumber: "", date: "", moneyChangerName: "", moneyChangerAddress: "", time: "", amount: "")
    
    
}
