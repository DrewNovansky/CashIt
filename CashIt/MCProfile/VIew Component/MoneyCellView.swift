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
            Text(currency.currencyName).frame(width: UIScreen.main.bounds.width/4)
            
            Text("Rp. \(currency.buyPrice, specifier: "%.2f")").frame(width: UIScreen.main.bounds.width/3, alignment: .leading)
            
            Text("Rp. \(currency.sellPrice, specifier: "%.2f")").frame(width: UIScreen.main.bounds.width/3, alignment: .leading)
        }.font(.body)
        .frame(height:UIScreen.main.bounds.height / 20)
    }
}

struct MoneyCellView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyCellView(currency: Currency(currencyId: 0, currencyName: "USD",  buyPrice: 14000, sellPrice: 1000))
    }
}
