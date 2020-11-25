//
//  RegisterView.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 24/11/20.
//

import SwiftUI

struct RegisterView: View {
    @State var username:String = ""
    @State var email:String = ""
    @State var password:String = ""
    @State var confPassword:String = ""
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                titleTemp(text: "Sign Up")
                Spacer()
            }
            Spacer()
            textFieldTemp(input: $username, textField: "Username")
            textFieldTemp(input: $email, textField: "Email")
            textFieldTemp(input: $password, textField: "Password")
            textFieldTemp(input: $confPassword, textField: "Confirmation Password")
            Spacer()
            NavigationLink(
                destination: RegisterView(),
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
