//
//  AppointmentSetCurrency.swift
//  CashIt
//
//  Created by Evan Renanto on 09/01/21.
//

import SwiftUI

struct AppointmentSetCurrency: View {
    @ObservedObject var viewModel = MCMakeAppointmentViewModel()
    @State var textFieldFrom: Int = 0
    @State var textFieldTo: Int = 0
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
                            .keyboardType(.numberPad)
                            .font(.title3)
                            .padding(5)
                            .border(Color.black,width: 3)
                            .padding(10)
                            .onChange(of: textFieldFrom, perform: { value in
//                                viewModel.appointment.toReceiveAmount = viewModel.calculateCurrency(calculateFor: "sell", buyName: currency[1], buyPrice: viewModel.appointment.toReceiveAmount, sellName: currency[2], sellPrice: viewModel.appointment.toExchangeAmount, buyField: viewModel.appointment.toReceiveAmount, sellField: viewModel.appointment.toExchangeAmount)
//                                textFieldFrom = viewModel.appointment.toReceiveAmount
                                textFieldTo = textFieldFrom/14000*1
                            })
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
                            .keyboardType(.numberPad)
                            .font(.title3)
                            .padding(5)
                            .border(Color.black,width: 3)
                            .padding(10)
                            .onChange(of: textFieldTo, perform: { value in
//                                viewModel.appointment.toExchangeAmount = viewModel.calculateCurrency(calculateFor: "buy", buyName: currency[1], buyPrice: viewModel.appointment.toReceiveAmount, sellName: currency[2], sellPrice: viewModel.appointment.toExchangeAmount, buyField: viewModel.appointment.toReceiveAmount, sellField: viewModel.appointment.toExchangeAmount)
//                                textFieldTo = viewModel.appointment.toReceiveAmount
                                textFieldFrom = textFieldTo/1*14000
                            })
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
        AppointmentSetCurrency(textFieldFrom: 1, textFieldTo: 1)
    }
}
