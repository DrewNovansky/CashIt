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
    var store : MoneyChanger
    var body: some View {
        NavigationLink(destination: viewModel.segue(showView: $showView, distance: distance), isActive: $showView){
            HStack(alignment: .center){
                Image("\(store.photo)")
                    .resizable()
                    .scaledToFit()
                    .frame(width:  UIScreen.main.bounds.height/10, height:  UIScreen.main.bounds.height/10)
                    .clipShape(Circle())
                    .padding(10)
                VStack(alignment:.leading){
                    Text("\(store.moneyChangerName)")
                        .fontWeight(.bold)
                    Text("\(store.address)")
                        .font(.caption)
                    Text("\(distance, specifier: "%.2f") Meter")
                        .font(.caption)
                }
                Spacer()
                //            Text("\(currency.buyPrice)")
                Text("1 \n = \n\(viewModel.currency[1].sellPrice,specifier: "%.2f")")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .padding()
            }.foregroundColor(.black)
            .font(.body)
            .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height/8)
            .background(Color("CardBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(5)
        }
    }
}

struct StoreListCellView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListCellView(showView: false, distance: 20, store: MoneyChanger(moneyChangerName: "Yatno", photo: "Test", address: "Jl Kasih Sayang", whatsappLink: "Test", phoneNumber: "Dihatimu", latitudeCoordinate: 1, longitudeCoordinate: 1))
    }
}
