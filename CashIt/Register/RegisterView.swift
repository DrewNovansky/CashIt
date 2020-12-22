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
    @State var showView:Bool = false
    @State var showAlert = false
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                titleTemp(text: "Sign Up")
                Spacer()
            }
            Spacer()
            textFieldTemp(input: $username, textField: "Username")
            textFieldTemp(input: $email, textField: "Email")
            passwordFieldTemp(input: $password, textField: "Password")
            passwordFieldTemp(input: $confPassword, textField: "Confirmation Password")
            Spacer()

            NavigationLink(destination: HomeView(), isActive: $showView){
                Button(action: {
                    if username == "" || email == "" || password == "" || confPassword == ""{
                        self.showAlert = true
                    }
                    else{
                        print("\(username)\n\(email)\n\(password)\n\(confPassword)")
                        showView = true
                    }
                }, label: {Text("Submit")
                    .font(.body)
                    .foregroundColor(.white)
                    .frame(
                        width: UIScreen.main.bounds.width*0.9,
                        height:UIScreen.main.bounds.height*0.05,
                        alignment: .center)
                    .background(Color("AccentColor"))
                    .padding(.bottom)})
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Error!"), message: Text("We're sorry but you need to fill all the box to register"), dismissButton: .cancel(Text("Okay")))
            }
        }.frame(width: UIScreen.main.bounds.width*0.9)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
