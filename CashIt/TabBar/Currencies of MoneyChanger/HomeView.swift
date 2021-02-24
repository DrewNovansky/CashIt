//
//  HomeView.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 25/11/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State private var searchText : String = ""
    @State var toExchangeCurrencyName = currencies[0]
    @State var toReceiveCurrencyName = currencies[0]
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("")
                        .padding()
                    SearchBar(text: $searchText, placeholder: "Cari nama money changer")
                    CurrencySelect(toExchangeCurrencyName: $toExchangeCurrencyName, toReceiveCurrencyName: $toReceiveCurrencyName)
                        .onTapGesture(perform: {
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        })
                        .onChange(of: toExchangeCurrencyName, perform: { value in
                           print("\(toExchangeCurrencyName)\n\n\n\n\n")
                            print("\(toReceiveCurrencyName)\n\n\n\n\n")
                            viewModel.toExchangeCurrencyName = toExchangeCurrencyName
                            viewModel.load(toExchangeCurrencyName: viewModel.toExchangeCurrencyName, toReceiveCurrencyName: viewModel.toReceiveCurrencyName)
                        })
                        .onChange(of: toReceiveCurrencyName, perform: { value in
                           print("\(toReceiveCurrencyName)\n\n\n\n\n")
                            print("\(toExchangeCurrencyName)\n\n\n\n\n")
                            viewModel.toReceiveCurrencyName = toReceiveCurrencyName
                            viewModel.load(toExchangeCurrencyName: viewModel.toExchangeCurrencyName, toReceiveCurrencyName: viewModel.toReceiveCurrencyName)
                        })
                    StoreList(viewModel: viewModel, searchText: $searchText)
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width-20)
                .onTapGesture(perform: {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                })
            }.navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(toExchangeCurrencyName: "IDR", toReceiveCurrencyName: "USD")
    }
}
