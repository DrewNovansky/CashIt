//
//  MCProfileView.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import SwiftUI

struct MCProfileView: View {
    
    var viewModel = MCProfileViewModel()
    @State var isTopNavigationActive = false
    @Binding var rootIsActive: Bool
    var body: some View {
        VStack{
            NavigationLink(
                destination: viewModel.segueToInfo(),
                isActive: $isTopNavigationActive,
                label: {Text("")
                    .navigationBarItems(trailing:
                                            HStack{
                                                Button(action: {
                                                    isTopNavigationActive.toggle()
                                                }, label: {
                                                    Image(systemName: "info.circle")
                                                        .resizable()
                                                        .foregroundColor(Color("AccentColor"))
                                                }).frame(width: 35, height: 35)
                                            }
                    )}
            )
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(5)
            
            Text(viewModel.moneyChanger.moneyChangerName)
                .font(.title2)
                .padding(5)
            Text("Monday " + "open" + " - " + "close")
                .padding(.bottom,5)
            
            HStack{
                VStack{
                    Text("Jarak")
                    Image(systemName: "map.fill")
                        .resizable()
                        .foregroundColor(Color("AccentColor"))
                        .frame(width: 45, height: 45)
                    Text("\(viewModel.moneyChanger.distance) "+"m")
                }.frame(width: UIScreen.main.bounds.width/3)
                VStack{
                    Text("Kontak")
                    Link(destination: viewModel.openWA()) {
                        Image(systemName: "text.bubble.fill")
                            .resizable()
                            .foregroundColor(Color("AccentColor"))
                            .frame(width: 45, height: 45)
                    }
                    Text(viewModel.wa)
                }.frame(width: UIScreen.main.bounds.width/3)
                VStack{
                    Text("\(viewModel.review.reviews.count)" + " Ulasan")
                    NavigationLink(destination: viewModel.segueToReview()){
                        HStack{
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color("AccentColor"))
                                .frame(width: 45, height: 45)
                        }
                    }
                    Text("Nilai: \(viewModel.review.getStoreRating())")
                }.frame(width: UIScreen.main.bounds.width/3)
            }.padding(5)
            
            VStack(alignment: .leading){
                HStack{
                    Text("Harga")
                        .fontWeight(.semibold)
                        .frame(width: UIScreen.main.bounds.width/4)
                    Text("Beli")
                        .fontWeight(.semibold)
                        .frame(width: UIScreen.main.bounds.width/3)
                    Text("Jual")
                        .fontWeight(.semibold)
                        .frame(width: UIScreen.main.bounds.width/3)
                }.font(.body)
                .padding(10)
                
                ScrollView(){
                    ForEach(viewModel.currency) { currency in
                        MoneyCellView(currency: currency)
                            .padding(3)
                        
                    }
                }
                .padding(5)
                .padding(.horizontal, 5)
            }.frame(width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height*0.3)
            .foregroundColor(.black)
            .background(Color("CardBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            Spacer()
                .padding()
            
            NavigationLink(destination: viewModel.segueToMakeAppointment(showView: $rootIsActive)) {
                Text("Buat Janji")
                    .frame(width: UIScreen.main.bounds.width-20, height: 45)
                    .foregroundColor(.white)
                    .background(Color("AccentColor"))
                    .cornerRadius(25)
                    .font(.title2)
            }.isDetailLink(false)
        }
        .navigationBarTitle(Text("Toko"), displayMode: .inline)
    }
}

struct MCProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MCProfileView(rootIsActive: .constant(false))
    }
}
