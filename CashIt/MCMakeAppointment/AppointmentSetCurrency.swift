//
//  AppointmentSetCurrency.swift
//  CashIt
//
//  Created by Evan Renanto on 09/01/21.
//

import SwiftUI

struct AppointmentSetCurrency: View {
    
    @Binding var switcher: Bool
    @Binding var textFieldFrom: Int
    @Binding var textFieldTo: Int
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                VStack{
                    HStack{
                        Text("Dari")
                        Spacer()
                    }
                    HStack{
                        AppointmentDropDownView()
                        Spacer()
                        TextField("Amount", value: $textFieldFrom, formatter: NumberFormatter())
                            .padding(10)
                            .border(Color.gray,width: 3)
                    }
                }
                
            }.zIndex(4)
            .font(Font.title2)
            
            HStack{
                VStack{
                    HStack{
                        Text("Ke")
                        Spacer()
                    }
                    HStack{
                        AppointmentDropDownView()
                        TextField("Amount", value: $textFieldTo, formatter: NumberFormatter())
                            .padding(10)
                            .border(Color.gray, width: 3)
                    }
                }
                
                
            }.zIndex(3)
            .font(Font.title2)
        }.zIndex(5)
    }
}

struct AppointmentSetCurrency_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentSetCurrency(switcher: .constant(false), textFieldFrom: .constant(1), textFieldTo: .constant(1))
    }
}
