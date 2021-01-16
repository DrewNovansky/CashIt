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
    @State var fromTo = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Spacer()
                    SearchBar(text: $searchText, placeholder: "Cari nama money changer")
                    CurrencySelect()
                    StoreList(searchText: $searchText)
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width-20)
                .navigationBarHidden(true)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
