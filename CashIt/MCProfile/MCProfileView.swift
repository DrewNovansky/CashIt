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
                destination: viewModel.segueToInfo(operationalHours: viewModel.operationalHours, distance: viewModel.distance),
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
            
//            Image(UserDefaults.standard.string(forKey: "photo") ?? "")
            Image("Test")
                .resizable()
                .clipShape(Circle())
                .frame(width: 100, height: 100, alignment: .center)
                .padding(5)
                
            
            Text("\(viewModel.moneyChanger.moneyChangerName)")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(5)
            let today = dateformatter()
            if (today == "Monday"){
                Text("\(today) \(viewModel.operationalHours[0].openTime) - \(viewModel.operationalHours[0].closeTime)")
            }
            else if (today == "Tuesday"){
                Text("\(today) \(viewModel.operationalHours[1].openTime) - \(viewModel.operationalHours[1].closeTime)")
            }
            else if (today == "Wednesday"){
                Text("\(today) \(viewModel.operationalHours[2].openTime) - \(viewModel.operationalHours[2].closeTime)")
            }
            else if (today == "Thursday"){
                Text("\(today) \(viewModel.operationalHours[3].openTime) - \(viewModel.operationalHours[3].closeTime)")
            }
            else if (today == "Friday"){
                Text("\(today) \(viewModel.operationalHours[4].openTime) - \(viewModel.operationalHours[4].closeTime)")
            }
            else if (today == "Saturday"){
                Text("\(today) \(viewModel.operationalHours[5].openTime) - \(viewModel.operationalHours[5].closeTime)")
            }
            else if (today == "Sunday"){
                Text("\(today) \(viewModel.operationalHours[6].openTime) - \(viewModel.operationalHours[6].closeTime)")
            }
            Text("Jarak: \(viewModel.distance) KM ")
                .padding(.bottom,5)
            HStack{
                VStack{
                    Text("Kontak")
                        .fontWeight(.semibold)
                    Link(destination: viewModel.openWA()) {
                        Image(systemName: "text.bubble.fill")
                            .resizable()
                            .foregroundColor(Color("AccentColor"))
                            .frame(width: 45, height: 45)
                    }
                    Text(viewModel.moneyChanger.phoneNumber)
                }.frame(width: UIScreen.main.bounds.width/3)
                VStack{
                    Text("\(viewModel.reviews.count)" + " Ulasan")
                        .fontWeight(.semibold)
                    NavigationLink(destination: viewModel.segueToReview(review: viewModel.reviews)){
                        HStack{
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color("AccentColor"))
                                .frame(width: 45, height: 45)
                        }
                    }
                    Text("Nilai: \(viewModel.getStoreRating())")
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
            
            NavigationLink(destination: viewModel.segueToMakeAppointment(showView: $rootIsActive, moneyChanger: viewModel.moneyChanger)) {
                Text("Buat Janji")
                    .frame(width: UIScreen.main.bounds.width-20, height: 45)
                    .foregroundColor(.white)
                    .background(Color("AccentColor"))
                    .cornerRadius(25)
                    .font(.title2)
                    .padding(.bottom)
            }.isDetailLink(false)
        }
        .navigationBarTitle(Text("Toko"), displayMode: .inline)
    }
}
func dateformatter() -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    let today = formatter.string(from: Date())
    return today
}

struct MCProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MCProfileView(rootIsActive: .constant(false))
    }
}
