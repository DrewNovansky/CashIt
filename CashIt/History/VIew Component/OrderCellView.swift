//
//  OrderCellView.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct OrderCellView: View {
    var transaction: Appointment
    var viewModel = HistoryViewModel()
    
    var body: some View {
        NavigationLink(
            destination: viewModel.segueToOrderDetail(history: transaction),
            label: {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(transaction.moneyChangerName)")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("\(transaction.toReceiveAmount) \(transaction.toReceiveCurrencyName)")
                        .font(.body)
                }.padding()
                Spacer()
                VStack {
                    Text("\(transaction.date)")
                        .font(.callout)
                    Text("\(transaction.status)")
                        .font(.callout)
                        .foregroundColor(Color("AccentColor"))
                }.padding([.top, .trailing])
            }
            .frame(width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height/10)
            .foregroundColor(.black)
            .background(Color("CardBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        })
    }
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView(transaction: Appointment(moneyChangerId: 0, moneyChangerName: "Test", address: "Test", orderNumber: "Test", status: "Test", date: "Test", time: "Test", toReceiveAmount: 0, toReceiveCurrencyName: "Test", toExchangeAmount: 0, toExchangeCurrencyName: "Test"))
    }
}
