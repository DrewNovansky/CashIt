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
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 90, height: 90, alignment: .center)
                    
                    Text("Hi, " + "Andrew")
                        .font(.system(size:25))
                        .padding()
                    
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width - 50)
                .padding(.top, 50)
                .padding(.bottom, 50)
                
                HStack{
                    Image(systemName: "doc.plaintext")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 25, height: 35)
                    
                    Text("  Pesanan Saya")
                        .font(.system(size:20))
                    
                    Spacer()
                    
                    NavigationLink(destination: viewModel.segueToHistory()){
                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 15, height: 25)
                    }
                    
                }.frame(width: UIScreen.main.bounds.width - 50)
                
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
                        .foregroundColor(.purple)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.purple, lineWidth: 5)
                                .frame(width: UIScreen.main.bounds.width - 100, height: 45)
                        )
                }
                
                
            }.navigationBarTitle(Text("Profil"), displayMode: .inline)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
