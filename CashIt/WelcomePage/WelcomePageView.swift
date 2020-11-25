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
                    Text("Sign In")
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(
                            width: UIScreen.main.bounds.width*0.7,
                            height:UIScreen.main.bounds.height*0.05,
                            alignment: .center)
                        .background(Color("AccentColor"))
                        .padding(.bottom)
                }
                )
                NavigationLink(destination: RegisterView(),label: {
                    Text("Sign Up")
                        .font(.body)
                        .foregroundColor(Color("AccentColor"))
                        .frame(
                            width: UIScreen.main.bounds.width*0.7,
                            height:UIScreen.main.bounds.height*0.05,
                            alignment: .center)
                        .background(Color(.white))
                        .padding(.bottom)
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
