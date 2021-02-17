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
    @State var showButton = false
    var body: some View {
        VStack {
            Image(UserDefaults.standard.string(forKey: "photo") ?? "")
                .resizable()
                .clipShape(Circle())
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.vertical,10)
            VStack{
                Text(viewModel.appointment.moneyChangerName)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack{
                    HStack{
                        Text("Lokasi")
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width / 3)
                    .font(Font.title3.weight(.semibold))
                    
                    HStack{
                        Text(viewModel.appointment.address)
                        Spacer()
                    }.font(.system(size: 19))
                }.padding(10)
                
                HStack{
                    HStack{
                        Text("Nomor Pesanan")
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width / 3)
                    .font(Font.title3.weight(.semibold))
                    
                    HStack{
                        Text(viewModel.appointment.orderNumber)
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
                        Text(viewModel.appointment.date)
                        Text(viewModel.appointment.time)
                        Spacer()
                    }.font(.system(size: 19))
                }.padding(10)
                Divider()
                    .frame(width: UIScreen.main.bounds.width-40)
                HStack{
                    HStack{
                        Text("Rangkuman Pesanan")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading,10)
                        Spacer()
                        VStack{
                        Text("Status")
                            .font(.body)
                            .fontWeight(.semibold)
                            Text(viewModel.appointment.status)
                                .font(.callout)
                                .foregroundColor(Color("AccentColor"))
                        }
                        .padding(.trailing)
                    }.frame(width: UIScreen.main.bounds.width-20)
                }.padding(10)
                VStack{
                    HStack{
                        Text("Dari")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.leading,10)
                        Spacer()
                    }
                    HStack{
                        Text(viewModel.appointment.toExchangeCurrencyName)
                            .frame(width: UIScreen.main.bounds.width / 3,alignment: .leading)
                            .padding(.leading,10)
                        Text("\(viewModel.appointment.toExchangeAmount)")
                            .frame(width: UIScreen.main.bounds.width / 2,alignment: .leading)
                        Spacer()
                    }.font(.title3)
                }.padding(5)
                HStack{
                    VStack{
                        HStack{
                            Text("Ke")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding(.leading,10)
                            Spacer()
                        }
                        HStack{
                            Text(viewModel.appointment.toReceiveCurrencyName)
                                .frame(width: UIScreen.main.bounds.width / 3,alignment: .leading)
                                .padding(.leading,10)
                            Text("\(viewModel.appointment.toReceiveAmount)")
                                .frame(width: UIScreen.main.bounds.width / 2,alignment: .leading)
                            Spacer()
                        }.font(.title3)
                    }
                }.padding(5)
            }.frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height * 0.6)
            .background(Color("CardBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }.navigationBarTitle("Detail Riwayat")
        if viewModel.appointment.status == "completed"{
        ReviewButton(isPresentingModalView: $isPresentingModalView)
        }
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView()
        //        OrderDetailView(transaction: Transaction(orderNumber: "190120001", date: "29/05/2020", moneyChangerName: "Maju Roso Money Changer", moneyChangerAddress: "Jln. Doang Jadian Kaga", time: "18:00", amount: "IDR 15000000 = USD 1000"))
    }
}
