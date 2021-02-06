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
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("")
                        .padding()
                    SearchBar(text: $searchText, placeholder: "Cari nama money changer")
                    CurrencySelect()
                        .onTapGesture(perform: {
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        })
                    StoreList(searchText: $searchText)
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
        HomeView()
    }
}
