
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
    @State var calculatePrice = true
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
                                    if calculatePrice == true{
                                    viewModel.appoinmentFromPrice = textFieldFrom
                                    //                                viewModel.appoinmentToPrice = viewModel.calculateCurrency(calculateFor: "sell", buyPrice: Int(viewModel.currency[itemSelected2].buyPrice), sellPrice: Int(viewModel.currency[itemSelected].sellPrice), buyField: viewModel.appoinmentToPrice, sellField: viewModel.appoinmentFromPrice)
                                    viewModel.appoinmentFrom = viewModel.currency[itemSelected].currencyName
                                    viewModel.appoinmentTo = viewModel.currency[itemSelected2].currencyName
                                    viewModel.appoinmentToPrice = viewModel.appoinmentFromPrice * Int(viewModel.currency[itemSelected].buyPrice) / Int(viewModel.currency[itemSelected2].sellPrice)
                                    print(textFieldFrom)
                                    print(itemSelected)
                                    print("\(itemSelected2) ini dropdown 2")
                                    print(viewModel.appoinmentFrom)
                                    print(viewModel.appoinmentFromPrice)
                                    print(viewModel.appoinmentTo)
                                    print(viewModel.appoinmentToPrice)
                                    viewModel.appoinmentFrom = viewModel.currency[itemSelected].currencyName
                                    textFieldTo = viewModel.appoinmentToPrice
                                    }else {calculatePrice = true}
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
                            AppointmentDropDownView2(text: $viewModel.currency[itemSelected2].currencyName, itemSelected: $itemSelected2)
                                .padding(5)
                            TextField("Amount", value: $textFieldTo, formatter: NumberFormatter())
                                .font(.title3)
                                .padding(5)
                                .border(Color.black,width: 3)
                                .padding(10)
                                .onChange(of: textFieldTo, perform: { value in
                                    if calculatePrice == true{
                                    viewModel.appoinmentToPrice = textFieldTo
                                    //                                viewModel.appoinmentFromPrice = viewModel.calculateCurrency(calculateFor: "buy", buyPrice: Int(viewModel.currency[itemSelected2].buyPrice), sellPrice: Int(viewModel.currency[itemSelected].sellPrice), buyField: viewModel.appoinmentToPrice, sellField: viewModel.appoinmentFromPrice)
                                    viewModel.appoinmentFromPrice = viewModel.appoinmentToPrice * Int(viewModel.currency[itemSelected2].sellPrice) / Int(viewModel.currency[itemSelected].buyPrice)
                                    viewModel.appoinmentFrom = viewModel.currency[itemSelected].currencyName
                                    viewModel.appoinmentTo = viewModel.currency[itemSelected2].currencyName
                                    print(itemSelected)
                                    print("\(itemSelected2) ini dropdown 2")
                                    print("\(viewModel.currency[itemSelected2].buyPrice) ini harga beli")
                                    print("\(viewModel.currency[itemSelected].sellPrice) ini harga jual")
                                        print(viewModel.appoinmentFrom)
                                        print(viewModel.appoinmentFromPrice)
                                    print(viewModel.appoinmentTo)
                                    print(viewModel.appoinmentToPrice)
                                    textFieldFrom = viewModel.appoinmentFromPrice
                                    } else {calculatePrice = false}
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
