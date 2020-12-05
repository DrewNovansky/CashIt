//
//  OrderCellView.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct OrderCellView: View {
    var moneyChangerName: String = ""
    var transaction: String = ""
    var date: String = ""
    
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(moneyChangerName)")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("\(transaction)")
                }.padding()
                
                Spacer()
                
                VStack {
                    Text("\(date)")
                }.padding()
            }
            .frame(width: 360, height: 107)
            .background(Color(red: 245/256, green: 245/256, blue: 245/256))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView()
    }
}
