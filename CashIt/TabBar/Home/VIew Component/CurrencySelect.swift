//
//  CurrencySelect.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 01/01/21.
//

import SwiftUI

struct CurrencySelect: View {
    var body: some View {
        HStack{
            VStack{
                HStack{
                    DropDown()
                }.zIndex(5)
                ZStack{
                Divider()
                }
                    DropDown()
            }.frame(height: UIScreen.main.bounds.height*0.15)
            
            .zIndex(6)
        }.zIndex(5)
        .padding(10)
    }
}

struct CurrencySelect_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelect()
    }
}
