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
                OrderCellView(moneyChangerName: "Dolarindo", transaction: "USD 500 - IDR 1500000", date: "29/05/2020")
                OrderCellView(moneyChangerName: "Dolarindo", transaction: "USD 500 - IDR 1500000", date: "29/05/2020")
                OrderCellView(moneyChangerName: "Dolarindo", transaction: "USD 500 - IDR 1500000", date: "29/05/2020")
            }
            .navigationTitle("History")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
