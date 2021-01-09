//
//  OrderDetailView.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct OrderDetailView: View {
    @State var isPresentingModalView = false
    var viewModel = OrderDetailViewModel()
    //    var viewModel: OrderDetailViewModel
    
    var body: some View {
        VStack {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.top, 14)
                .padding(.bottom, 14)
            
            Text(viewModel.name)
                .font(.system(size:25))
            
            HStack{
                HStack{
                    Text("Lokasi")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 3)
                .font(Font.title3.weight(.bold))
                
                HStack{
                    Text(viewModel.address)
                    Spacer()
                }.font(.system(size: 19))
            }.padding(10)
            
            HStack{
                HStack{
                    Text("Nomor Pesanan")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 3)
                .font(Font.title3.weight(.bold))
                
                HStack{
                    Text("191020001")
                    Spacer()
                }.font(.system(size: 19))
            }.padding(10)
            
            HStack{
                HStack{
                    Text("Waktu & Tanggal")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 3)
                .font(Font.title3.weight(.bold))
                
                HStack{
                    Text("11 Januari Bertemu")
                    Text("19:00")
                    Spacer()
                }.font(.system(size: 19))
            }.padding(10)
            
            HStack{
                HStack{
                    Text("Rangkuman Pesanan")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 2)
                .font(Font.title2)
                
                Spacer()
                
            }.padding(10)
            
            Divider()
            
            HStack{
                VStack{
                    HStack{
                        Text("Dari")
                        Spacer()
                    }
                    
                    HStack{
                        Text(viewModel.fromName)
                            .frame(width: UIScreen.main.bounds.width / 3,alignment: .leading)
                        Text("\(viewModel.fromTotal)")
                            .frame(width: UIScreen.main.bounds.width / 2,alignment: .leading)
                        Spacer()
                    }.font(Font.title2)
                }
                
            }.padding(10)
            
            HStack{
                VStack{
                    HStack{
                        Text("Ke")
                        Spacer()
                    }
                    
                    HStack{
                        Text(viewModel.toName)
                            .frame(width: UIScreen.main.bounds.width / 3,alignment: .leading)
                        Text("\(viewModel.toTotal)")
                            .frame(width: UIScreen.main.bounds.width / 2,alignment: .leading)
                        Spacer()
                    }.font(Font.title2)
                }
                
            }.padding(10)
            
            Spacer()
            
            
        }.navigationBarTitle("Order Detail")
        ReviewButton(isPresentingModalView: $isPresentingModalView)
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView()
        //        OrderDetailView(transaction: Transaction(orderNumber: "190120001", date: "29/05/2020", moneyChangerName: "Maju Roso Money Changer", moneyChangerAddress: "Jln. Doang Jadian Kaga", time: "18:00", amount: "IDR 15000000 = USD 1000"))
    }
}
