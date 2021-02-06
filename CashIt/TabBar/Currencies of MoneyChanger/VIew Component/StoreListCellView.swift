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
    var distance: Double
    var store : MoneyChangerDetail
    var body: some View {
        NavigationLink(destination: viewModel.segue(showView: $showView, distance: distance, moneyChanger: store), isActive: $showView,label:{
            HStack(alignment: .center){
                Image("\(store.moneyChanger.photo)")
                    //                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:  UIScreen.main.bounds.height/12, height:  UIScreen.main.bounds.height/12)
                    .clipShape(Circle())
                    .padding(10)
                VStack(alignment:.leading){
                    Text("\(store.moneyChanger.moneyChangerName)")
                        .fontWeight(.bold)
                    Text("\(store.moneyChanger.address)")
                        .font(.caption)
                    Text("\(distance, specifier: "%.2f") KM")
                        .font(.caption)
                }
                Spacer()
                //            Text("\(currency.buyPrice)")
                Text("\(store.exchangeRate)")
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding()
            }.foregroundColor(.black)
            .font(.body)
            .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height/8)
            .background(Color("CardBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(5)
        })
    }
}

struct StoreListCellView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListCellView(showView: false, distance: 40, store: MoneyChangerDetail(moneyChanger: MoneyChangerDetail.MoneyChanger(moneyChangerId: 0,moneyChangerName: "Rainbow Bridge Money Changer",  photo: "Test", address: "Jl.Raya Kb.Jeruk Gg.H. Salbini No.27 RT.1 RW.9",whatsappLink: "wa.me/6281291286046", phoneNumber: "081291286046",latitudeCoordinate:-6.2018528,longitudeCoordinate: 106.782557), exchangeRate: 16000) )
    }
}
