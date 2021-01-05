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
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                NavigationLink(
                    destination: MCInfoView(),
                    isActive: $isTopNavigationActive,
                    label: {Text("")
                        .navigationBarItems(trailing:
                                                HStack{
                                                    Image(systemName: "info.circle")
                                                        .resizable()
                                                        .onTapGesture(count: 1, perform: {
                                                            isTopNavigationActive = true
                                                        })
                                                        .frame(width: 35, height: 35)
                                                }
                        )}
                )
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 100, alignment: .center)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.top, 14)
                    .padding(.bottom, 14)
                
                Text(viewModel.name)
                    .font(.system(size:25))
                
                //                Text("Monday " + open + " - " + close)
                //                    .padding(.bottom, 15)
                Spacer()
                
                HStack{
                    
                    VStack{
                        
                        Text("Location")
                        
                        Image(systemName: "map.fill")
                            .resizable()
                            .foregroundColor(.green)
                            .frame(width: 45, height: 45)
                        
                        Text("500 "+"m")
                        
                    }.frame(width: UIScreen.main.bounds.width/3)
                    
                    Spacer()
                    
                    VStack{
                        
                        Text("Contact")
                        
                        Link(destination: URL(string: "https://wa.me/\(viewModel.wa)")!) {
                            Image(systemName: "message.fill")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 45, height: 45)
                        }
                        
                        Text(viewModel.wa)
                        
                    }.frame(width: UIScreen.main.bounds.width/3)
                    
                    Spacer()
                    
                    VStack{
                        
                        Text("\(viewModel.review.reviews.count)" + " Review(s)")
                        
                        NavigationLink(destination: MCReviewView()){
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
                    Text("Price").frame(maxWidth: UIScreen.main.bounds.width/3)
                    
                    Text("Buy").frame(maxWidth: UIScreen.main.bounds.width/3)
                    
                    Text("Sell").frame(maxWidth: UIScreen.main.bounds.width/3)
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
                
                NavigationLink(destination: MCMakeAppointmentView()) {
                    Text("Make an Appoinment")
                        .frame(width: UIScreen.main.bounds.width - 20, height: 45)
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(25)
                        .font(.title2)
                }
                
            }.navigationBarTitle(Text("Store"), displayMode: .inline)
        }
    }
}

struct MCProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MCProfileView()
    }
}
