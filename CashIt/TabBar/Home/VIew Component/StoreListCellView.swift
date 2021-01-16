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
    var store : MoneyChanger
    var body: some View {
        NavigationLink(
            destination: viewModel.segue(showView: $showView),
            label: {
        HStack(alignment: .top){
            Image("\(store.photo)")
                .resizable()
                .scaledToFit()
                .frame(width:  UIScreen.main.bounds.height/10, height:  UIScreen.main.bounds.height/10)
                .clipShape(Circle())
            
            VStack(alignment:.leading){
                Text("\(store.moneyChangerName)")
                Text("\(store.address)")
                Text("\(store.distance, specifier: "%.2f") Meter")
            }
            Spacer()
            Text("*CURRENCY*")
                .padding()
        }.foregroundColor(.black)
        .font(.title3)
        .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height/8)
        .background(Color("CardBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(5)
            }).isDetailLink(false)
    }
}

//struct StoreListCellView_Previews: PreviewProvider {
//    static var previews: some View {
////        StoreListCellView()
//        Text
//    }
//}
