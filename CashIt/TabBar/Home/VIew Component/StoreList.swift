//
//  StoreList.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 01/01/21.
//

import SwiftUI

struct StoreList: View {
    @ObservedObject var viewModel = HomeViewModel()
    @Binding var searchText: String
    var action: (() -> Bool)?
    var body: some View {
        VStack{
            ScrollView{
                ForEach(viewModel.store.filter {
                    self.searchText.isEmpty ? true : $0.moneyChangerName.lowercased().contains(self.searchText.lowercased())
                }, id: \.self) { item in
                    StoreListCellView(store: item)
                }
            }
        }.frame(height: UIScreen.main.bounds.height*0.6)
    }
}

struct StoreList_Previews: PreviewProvider {
    static var previews: some View {
        StoreList(searchText: .constant(""))
    }
}
