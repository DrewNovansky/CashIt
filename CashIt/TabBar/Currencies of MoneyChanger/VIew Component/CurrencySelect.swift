//
//  CurrencySelect.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 01/01/21.
//

import SwiftUI

struct CurrencySelect: View {
    var viewModel = HomeViewModel()
    @Binding var toExchangeCurrencyName : String
    @Binding var toReceiveCurrencyName : String
    var body: some View {
        HStack{
            VStack{
                HStack{
                    Text("Dari :")
                        .fontWeight(.bold)
                        .frame(width: (UIScreen.main.bounds.width/2)-20, alignment: .leading)
                    Text("Ke :")
                        .fontWeight(.bold)
                        .frame(width: (UIScreen.main.bounds.width/2)-20, alignment: .leading)
                }.zIndex(5)
                HStack{
                    DropDown(text: $toExchangeCurrencyName)
                        .frame(width: (UIScreen.main.bounds.width/2)-20, alignment: .leading)
                    DropDown2(text: $toReceiveCurrencyName)
                        .frame(width: (UIScreen.main.bounds.width/2)-20, alignment: .leading)
                }.zIndex(4)
            }.frame(height: UIScreen.main.bounds.height*0.1)
            .font(.title2)
            .zIndex(6)
        }.zIndex(5)
        .padding(10)
    }
}
