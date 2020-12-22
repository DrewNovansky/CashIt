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
                    ButtonStyleTemp(buttonText: "Sign In")
                }
                )
                NavigationLink(destination: RegisterView(),label: {
                    ButtonStyleTemp(buttonText: "Sign Up", backgroundColor: Color(.white), foregroundColor: Color("AccentColor"))
                }
                )
            }
        }
    }
}

struct ButtonStyleTemp: View{
    var buttonText:String = ""
    var backgroundColor:Color = Color("AccentColor")
    var foregroundColor:Color = Color(.white)
    var body: some View{
    Text("\(buttonText)")
        .font(.body)
        .foregroundColor(foregroundColor)
        .frame(
            width: UIScreen.main.bounds.width*0.7,
            height:UIScreen.main.bounds.height*0.05,
            alignment: .center)
        .background(backgroundColor)
        .padding(.bottom)
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
