//
//  HistoryView.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            ScrollView() {
                OrderCellView(transaction: Transaction(orderNumber: "190120001", date: "29/05/2020", moneyChangerName: "Maju Roso Money Changer", moneyChangerAddress: "Jln. Doang Jadian Kaga", time: "18:00", amount: "IDR 15000000 = USD 1000"))
                
                OrderCellView(transaction: Transaction(orderNumber: "190120002", date: "29/05/2020", moneyChangerName: "Mundur Roso Money Changer", moneyChangerAddress: "Jln. Doang Jadian Kaga", time: "18:00", amount: "IDR 15000000 = USD 1000"))
                
                OrderCellView(transaction: Transaction(orderNumber: "190120003", date: "29/05/2020", moneyChangerName: "Maju Rasa Money Changer", moneyChangerAddress: "Jln. Doang Jadian Kaga", time: "18:00", amount: "IDR 15000000 = USD 1000"))
                    
            }
            .navigationBarTitle("History")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .previewDevice("iPhone 11")
    }
}
