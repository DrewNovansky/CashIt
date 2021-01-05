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
        
        ZStack{
                    VStack{
                        SearchBar(text: $searchText, placeholder: "Search money changer store")
                        CurrencySelect(fromTo: $fromTo)
                        StoreList(searchText: $searchText)
                    }
            }
            .padding()
        .navigationBarHidden(true)
}
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
//        HomeView( locValue: locValue)
        Text("Hai")
    }
}
