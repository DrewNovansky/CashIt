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
    @State var showView: Bool = false
    var body: some View {
        NavigationLink(destination: viewModel.segue(), isActive: $showView){
            List{
                ForEach(viewModel.store.filter {
                    self.searchText.isEmpty ? true : $0.storeName.lowercased().contains(self.searchText.lowercased())
                }, id: \.self) { item in
                    HStack(alignment: .top){
                        Image("\(item.storeLogo)")
                            .clipShape(Circle())
                            .padding()
                        
                        VStack(alignment:.leading){
                            Text("\(item.storeName)")
                            Text("\(item.storeAddress)")
                        }
                        Spacer()
                        Text("\(item.storePrice)")
                    }.onTapGesture {
                        showView.toggle()
                    }
                }
            }
            .border(Color.black, width: 1)
        }
    }
}

struct StoreList_Previews: PreviewProvider {
    static var previews: some View {
        StoreList(searchText: .constant(""))
    }
}
