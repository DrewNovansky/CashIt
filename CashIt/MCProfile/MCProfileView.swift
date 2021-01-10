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
                                                    }).frame(width: 35, height: 35)
                                                }
                        )}
                )
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding(.top, 14)
                    .padding(.bottom, 14)
                
                Text(viewModel.name)
                    .font(.system(size:25))
                
                //                Text("Monday " + open + " - " + close)
                //                    .padding(.bottom, 15)
                Spacer()
                
                HStack{
                    
                    VStack{
                        
                        Text("Lokasi")
                        
                        Image(systemName: "map.fill")
                            .resizable()
                            .foregroundColor(.green)
                            .frame(width: 45, height: 45)
                        
                        Text("500 "+"m")
                        
                    }.frame(width: UIScreen.main.bounds.width/3)
                    
                    Spacer()
                    
                    VStack{
                        
                        Text("Kontak")
                        
                        Link(destination: viewModel.openWA()) {
                            Image(systemName: "text.bubble.fill")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 45, height: 45)
                        }
                        
                        Text(viewModel.wa)
                        
                    }.frame(width: UIScreen.main.bounds.width/3)
                    
                    Spacer()
                    
                    VStack{
                        
                        Text("\(viewModel.review.reviews.count)" + " Ulasan")
                        
                        NavigationLink(destination: viewModel.segueToReview()){
                            HStack{
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundColor(.yellow)
                                    .frame(width: 45, height: 45)
                            }
                        }
                        
                        Text("\(viewModel.review.getStoreRating())")
                        
                    }.frame(width: UIScreen.main.bounds.width/3)
                    
                    Spacer()
                    
                }.padding(10)
                
                Spacer()
                
                HStack{
                    Text("Harga").frame(maxWidth: UIScreen.main.bounds.width/3)
                    
                    Text("Beli").frame(maxWidth: UIScreen.main.bounds.width/3)
                    
                    Text("Jual").frame(maxWidth: UIScreen.main.bounds.width/3)
                }.font(.system(size: 20))
                .frame(maxWidth: (UIScreen.main.bounds.width - 20))
                
                ScrollView(){
                    ForEach(viewModel.currency) { currency in
                        MoneyCellView(currency: currency)
                        Divider()
                    }
                }.frame(maxWidth: UIScreen.main.bounds.width - 20)
                .border(Color.black, width: 1)
                
                
                Spacer()
                
                NavigationLink(destination: viewModel.segueToMakeAppointment(showView: $rootIsActive)) {
                    Text("Buat Janji")
                        .frame(width: UIScreen.main.bounds.width - 20, height: 45)
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(25)
                        .font(.title2)
                }.isDetailLink(false)
                
            }.navigationBarTitle(Text("Toko"), displayMode: .inline)
        }
}

struct MCProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MCProfileView(rootIsActive: .constant(false))
    }
}
