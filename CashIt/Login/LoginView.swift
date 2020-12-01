//
//  LoginView.swift
//  CashItTests
//
//  Created by Andrew Novansky Ignatius on 24/11/20.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                titleTemp(text: "Sign In")
                Spacer()
            }
            Spacer()
            
            textFieldTemp(input: $email, textField: "Email")
            textFieldTemp(input: $password, textField: "Password")
            
            Spacer()
            NavigationLink(
                destination: HomeView(),
                label: {
                    Text("Submit")
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(
                            width: UIScreen.main.bounds.width*0.9,
                            height:UIScreen.main.bounds.height*0.05,
                            alignment: .center)
                        .background(Color("AccentColor"))
                        .padding(.bottom)
                })
        }.frame(width: UIScreen.main.bounds.width*0.9)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
