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
                    
                    if switcher{
                        AppoinmentDropDownView()
                    }else{
                        Text("IDR")
                    }
                    
                }
                
                TextField("Amount", value: $textFieldFrom, formatter: NumberFormatter())
                
            }.font(Font.title2)
            
            HStack{
                VStack{
                    HStack{
                        Text("Ke")
                        Spacer()
                    }
                    
                    if switcher{
                        Text("IDR")
                    }else{
                        AppoinmentDropDownView()
                    }
                    
                }
                
                TextField("Amount", value: $textFieldTo, formatter: NumberFormatter())
                
            }.font(Font.title2)
        }
    }
}

struct AppointmentSetCurrency_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentSetCurrency(switcher: .constant(false), textFieldFrom: .constant(1), textFieldTo: .constant(1))
    }
}
