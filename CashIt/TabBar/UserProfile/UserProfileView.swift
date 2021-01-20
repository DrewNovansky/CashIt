//
//  UserProfileView.swift
//  CashIt
//
//  Created by Evan Renanto on 07/01/21.
//

import SwiftUI

struct UserProfileView: View {
    
    var viewModel = UserProfileViewModel()
    @Binding var rootIsActive : Bool
    var body: some View {
        NavigationView{
        VStack{
            HStack{
                Text("Hi, " + "\(viewModel.user.username)")
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
            Spacer()
            Button(action: {
                rootIsActive = false
            }, label: {
                Text("Keluar")
                    .font(.title2)
                    .foregroundColor(.red)
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color(.red), lineWidth: 5)
                            .frame(width: UIScreen.main.bounds.width - 20, height: 45)
                            .padding(10)
                    )
                    .padding()
                    .padding(.bottom)
            }).navigationBarTitle(Text("Profil"), displayMode: .inline)
                
        }.navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView( rootIsActive: .constant(false))
    }
}
