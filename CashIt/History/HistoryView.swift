//
//  HistoryView.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct HistoryView: View {
    var viewModel = HistoryViewModel()
    
    var body: some View {
            ScrollView() {
                ForEach(viewModel.appointment) { transaction in
                    OrderCellView(transaction: transaction)
                }
            }.padding()
            .navigationBarTitle("Riwayat")
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .previewDevice("iPhone 11")
    }
}
