//
//  MoneyCellView.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import SwiftUI

struct MoneyCellView: View {
    
    var currency: Currency
    
    var body: some View {
        HStack{
            Text(currency.priceName).frame(width: UIScreen.main.bounds.width/3)
            
            Text("Rp. \(currency.priceBuy)").frame(maxWidth: UIScreen.main.bounds.width/2, alignment: .leading)
            
            Text("Rp. \(currency.priceSell)").frame(maxWidth: UIScreen.main.bounds.width/2, alignment: .leading)
        }.font(.system(size: 20))
        .frame(height:40)
    }
}

struct MoneyCellView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyCellView(currency: Currency(priceName: "USD", priceBuy: 14000, priceSell: 1000))
    }
}
