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
        VStack{
        VStack(alignment: .leading){
            HStack{
                VStack{
                    HStack{
                        Text("Dari")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(5)
                        Spacer()
                    }
                    HStack(alignment: .center){
                        AppointmentDropDownView()
                            .padding(5)
                        Spacer()
                        TextField("Amount", value: $textFieldFrom, formatter: NumberFormatter())
                            .font(.title3)
                            .padding(5)
                            .border(Color.black,width: 3)
                            .padding(10)
                    }
                }
                
            }.zIndex(4)
            
            HStack{
                VStack{
                    HStack{
                        Text("Ke")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(5)
                        Spacer()
                    }
                    HStack(alignment: .center){
                        AppointmentDropDownView()
                            .padding(5)
                        TextField("Amount", value: $textFieldTo, formatter: NumberFormatter())
                            .font(.title3)
                            .padding(5)
                            .border(Color.black,width: 3)
                            .padding(10)
                    }
                }
                
                
            }.zIndex(3)
        }
        }.frame(width: UIScreen.main.bounds.width - 20, height:UIScreen.main.bounds.height*0.25)
        
        .zIndex(5)
    }
}

struct AppointmentSetCurrency_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentSetCurrency(switcher: .constant(false), textFieldFrom: .constant(1), textFieldTo: .constant(1))
    }
}
