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
            destination: viewModel.segueToOrderDetail(),
            label: {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("*MONEY CHANGER NAME*")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("\(transaction.toExchangeAmount)")
                        .font(.body)
                }.padding()
                
                VStack {
                    Text("\(transaction.date)")
                        .font(.body)
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
        Text("Hai")
    }
}
