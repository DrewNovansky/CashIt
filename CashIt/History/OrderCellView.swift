//
//  OrderCellView.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct OrderCellView: View {
    var transaction: Transaction
    var viewModel = HistoryViewModel()
    
    var body: some View {
        NavigationLink(
            destination: viewModel.segueToOrderDetail(),
            label: {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(transaction.moneyChangerName)")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("\(transaction.amount)")
                }.padding()
                
                Spacer()
                
                VStack {
                    Text("\(transaction.date)")
                }.padding()
            }
            .frame(width: UIScreen.main.bounds.width*0.85, height: 107)
            .background(Color(red: 245/256, green: 245/256, blue: 245/256))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView(transaction: Transaction(orderNumber: "190120001", date: "29/05/2020", moneyChangerName: "Maju Roso Money Changer", moneyChangerAddress: "Jln. Doang Jadian Kaga", time: "18:00", amount: "IDR 15000000 = USD 1000"))
    }
}
