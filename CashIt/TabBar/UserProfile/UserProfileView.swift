//
//  UserProfileView.swift
//  CashIt
//
//  Created by Evan Renanto on 07/01/21.
//

import SwiftUI

struct UserProfileView: View {
    
    var viewModel = UserProfileViewModel()
    
    var body: some View {
        NavigationView{
        VStack{
            HStack{
                Text("Hi, " + "Andrew")
                    .font(.system(size:25))
                    .padding()
                
                Spacer()
            }.frame(width: UIScreen.main.bounds.width - 50)
            NavigationLink(destination: viewModel.segueToHistory()){
            HStack{
                Image(systemName: "doc.plaintext")
                    .resizable()
                    .foregroundColor(Color("AccentColor"))
                    .frame(width: 25, height: 35)
                Text("  Pesanan Saya")
                    .font(.title3)
                Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 15, height: 25)
                }.frame(width: UIScreen.main.bounds.width - 50)
            .foregroundColor(.black)
            }
            Divider()
            //                HStack{
            //                    Image(systemName: "star.fill")
            //                        .resizable()
            //                        .foregroundColor(.blue)
            //                        .frame(width: 35, height: 35)
            //
            //                    Text("Nilai Aplikasi Kami")
            //                        .font(.system(size:20))
            //
            //                    Spacer()
            //
            //                    Image(systemName: "chevron.right")
            //                        .resizable()
            //                        .foregroundColor(.gray)
            //                        .frame(width: 15, height: 25)
            //                }.frame(width: UIScreen.main.bounds.width - 50)
            //                Divider()
            Spacer()
            
            NavigationLink(destination: WelcomePageView()) {
                Text("Keluar")
                    .font(.title2)
                    .cornerRadius(40)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("AccentColor"), lineWidth: 5)
                            .frame(width: UIScreen.main.bounds.width - 20, height: 45)
                    )
            }.navigationBarTitle(Text("Profil"), displayMode: .inline)
        }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
