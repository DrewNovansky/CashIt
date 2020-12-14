//
//  OrderDetailView.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct OrderDetailView: View {
    @State var isPresentingModalView = false
    
    var transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                TitleLabel(title: "DATE")
                ContentLabel(content: transaction.date
                )
            }.padding(.top)
            VStack(alignment: .leading) {
                TitleLabel(title: "ORDER NUMBER")
                ContentLabel(content: transaction.orderNumber)
            }.padding(.top)
            VStack(alignment: .leading) {
                TitleLabel(title: "MONEY CHANGER")
                ContentLabel(content: transaction.moneyChangerName)
            }.padding(.top)
            VStack(alignment: .leading) {
                TitleLabel(title: "ADDRESS")
                ContentLabel(content: transaction.moneyChangerAddress)
            }.padding(.top)
            VStack(alignment: .leading) {
                TitleLabel(title: "TIME")
                ContentLabel(content: transaction.time)
            }.padding(.top)
            VStack(alignment: .leading) {
                TitleLabel(title: "TRANSACTION")
                ContentLabel(content:
                                transaction.amount)
            }.padding(.top)
            
            Spacer()
            
            VStack {
                ReviewButton(isPresentingModalView: $isPresentingModalView)
            }.padding()
        }.navigationBarTitle("Detail")
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(transaction: Transaction(orderNumber: "190120001", date: "29/05/2020", moneyChangerName: "Maju Roso Money Changer", moneyChangerAddress: "Jln. Doang Jadian Kaga", time: "18:00", amount: "IDR 15000000 = USD 1000"))
    }
}
