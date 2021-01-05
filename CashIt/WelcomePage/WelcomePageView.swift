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
                Text("Hello World!")
                    .font(.title)
                    .foregroundColor(Color("AccentColor"))
                Spacer()
                NavigationLink(destination: LoginView(),label: {
                    SignInButton(buttonText: "Sign In")
                }
                )
                NavigationLink(destination: RegisterView(),label: {
                    SignInButton(buttonText: "Sign Up", backgroundColor: Color(.white), foregroundColor: Color("AccentColor"))
                }
                )
            }
        }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
