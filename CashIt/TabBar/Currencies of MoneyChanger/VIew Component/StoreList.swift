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
    var body: some View {
        VStack{
            ScrollView{
                ForEach(viewModel.store.filter {
                    self.searchText.isEmpty ? true : $0.moneyChanger.moneyChangerName.lowercased().contains(self.searchText.lowercased())
                }, id: \.self) { item in
                    let distance = viewModel.countDistance(loc1Latitude:
                                                            item.moneyChanger.latitudeCoordinate, loc1Longitude: item.moneyChanger.longitudeCoordinate)
                    StoreListCellView(distance: distance, store: item )
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
