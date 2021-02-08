
//  AppointmentSetCurrency.swift
//  CashIt
//  Created by Evan Renanto on 09/01/21.

import SwiftUI

struct AppointmentSetCurrency: View {
    @ObservedObject var viewModel = MCMakeAppointmentViewModel()
    @State var textFieldFrom: Int = 0
    @State var textFieldTo: Int = 0
    @State var itemSelected: Int = 0
    @State var itemSelected2: Int = 0
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
                        AppointmentDropDownView(text: $viewModel.currency[itemSelected].currencyName, itemSelected: $itemSelected)
                            .padding(5)
                        Spacer()
                        TextField("Amount", value: $textFieldFrom, formatter: NumberFormatter())
                            .font(.title3)
                            .padding(5)
                            .border(Color.black,width: 3)
                            .padding(10)
                            .onChange(of: textFieldFrom, perform: { value in
                                viewModel.appoinmentFromPrice = textFieldFrom
                                viewModel.appoinmentToPrice = viewModel.calculateCurrency(calculateFor: "sell", buyPrice: Int(viewModel.currency[itemSelected2].buyPrice), sellPrice: Int(viewModel.currency[itemSelected].sellPrice), buyField: viewModel.appoinmentToPrice, sellField: viewModel.appoinmentFromPrice)
                                print(itemSelected)
                                print("\(itemSelected2) ini dropdown 2")
                                print(viewModel.appoinmentTo)
                                print(viewModel.appoinmentToPrice)
                                print(viewModel.appoinmentFrom)
                                print(viewModel.appoinmentFromPrice)
                                viewModel.appoinmentFrom = viewModel.currency[itemSelected].currencyName
                                viewModel.appoinmentTo = viewModel.currency[itemSelected2].currencyName
                                textFieldTo = viewModel.appoinmentToPrice
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
                        AppointmentDropDownView(text: $viewModel.currency[itemSelected2].currencyName, itemSelected: $itemSelected2)
                            .padding(5)
                        TextField("Amount", value: $textFieldTo, formatter: NumberFormatter())
                            .font(.title3)
                            .padding(5)
                            .border(Color.black,width: 3)
                            .padding(10)
                            .onChange(of: textFieldTo, perform: { value in
                                viewModel.appoinmentToPrice = textFieldTo
                                viewModel.appoinmentFromPrice = viewModel.calculateCurrency(calculateFor: "buy", buyPrice: Int(viewModel.currency[itemSelected2].buyPrice), sellPrice: Int(viewModel.currency[itemSelected].sellPrice), buyField: viewModel.appoinmentToPrice, sellField: viewModel.appoinmentFromPrice)
                                viewModel.appoinmentFrom = viewModel.currency[itemSelected].currencyName
                                viewModel.appoinmentTo = viewModel.currency[itemSelected2].currencyName
                                print(itemSelected)
                                print("\(itemSelected2) ini dropdown 2")
                                print(viewModel.appoinmentTo)
                                print(viewModel.appoinmentToPrice)
                                print(viewModel.appoinmentFrom)
                                print(viewModel.appoinmentFromPrice)
                                textFieldFrom = viewModel.appoinmentFromPrice
//                                textFieldFrom = textFieldTo*14000/1
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
