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
                    SearchBar(text: $searchText, placeholder: "Cari nama money changer")
                    CurrencySelect(fromTo: $fromTo)
                    StoreList(searchText: $searchText)
                }
            }
        }.navigationBarHidden(true)
        .padding()
        .navigationBarTitle(Text(""),displayMode: .inline)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
