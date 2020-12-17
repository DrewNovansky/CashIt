//
//  HistoryViewModel.swift
//  CashIt
//
//  Created by Sherwin Yang on 07/12/20.
//

import Foundation

class HistoryViewModel {
    var transactions: [Transaction] = []
    
    // Dummy Data
    init() {
        self.transactions.append(contentsOf: [
            Transaction(orderNumber: "190120001", date: "29/05/2020", moneyChangerName: "Maju Roso Money Changer", moneyChangerAddress: "Jln. Doang Jadian Kaga", time: "18:00", amount: "IDR 15000000 = USD 1000"),
            Transaction(orderNumber: "190120002", date: "29/05/2020", moneyChangerName: "Mundur Roso Money Changer", moneyChangerAddress: "Jln. Doang Jadian Kaga", time: "18:00", amount: "IDR 15000000 = USD 1000"),
            Transaction(orderNumber: "190120003", date: "29/05/2020", moneyChangerName: "Maju Rasa Money Changer", moneyChangerAddress: "Jln. Doang Jadian Kaga", time: "18:00", amount: "IDR 15000000 = USD 1000")
        ])
    }
    
    func getTransaction(index: Int) -> Transaction {
        return transactions[index]
    }
}
