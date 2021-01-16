//
//  WelcomePageView.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 24/11/20.
//

import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Cash It!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("AccentColor"))
                    .padding(.top,20)
                    .padding()
                Spacer()
                NavigationLink(destination: LoginView(),label: {
                    SignInButton(buttonText: "Masuk")
                }
                )
                NavigationLink(destination: RegisterView(),label: {
                    SignInButton(buttonText: "Daftar", backgroundColor: Color(.white), foregroundColor: Color("AccentColor"))
                }
                )
            }.navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
