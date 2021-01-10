//
//  StoreListCellView.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 10/01/21.
//

import SwiftUI

struct StoreListCellView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var showView: Bool = false
    var store : Store
    var body: some View {
        NavigationLink(
            destination: viewModel.segue(showView: $showView),
            label: {
        HStack(alignment: .top){
            Image("\(store.storeLogo)")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .clipShape(Circle())
            
            VStack(alignment:.leading){
                Text("\(store.storeName)")
                Text("\(store.storeAddress)")
            }
            Spacer()
            Text("\(store.storePrice)")
        }
            }).isDetailLink(false)
    }
}

//struct StoreListCellView_Previews: PreviewProvider {
//    static var previews: some View {
////        StoreListCellView()
//        Text
//    }
//}
