//
//  Transaction.swift
//  CashIt
//
//  Created by Sherwin Yang on 07/12/20.
//

import Foundation

struct Transaction: Identifiable {
    var id = UUID()
    var orderNumber: String
    var date: String
    var moneyChangerName: String
    var moneyChangerAddress: String
    var time: String
    var amount: String
}
