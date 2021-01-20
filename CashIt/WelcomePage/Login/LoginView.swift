//
//  LoginView.swift
//  CashItTests
//
//  Created by Andrew Novansky Ignatius on 24/11/20.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @State var showView: Bool = false
    @State var showView2: Bool = false
    @State var showAlert: Bool = false
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                TitleTemp(text: "Masuk")
                    .padding([.top, .bottom, .trailing], 10)
                Spacer()
            }
            Spacer()
            
            TextFieldTemp(input: self.$viewModel.user.email, textField: "Email")
                .onChange(of: viewModel.user.email, perform: { email in
                    UserDefaults.standard.set(self.viewModel.user.email, forKey: "email")
                })
            PasswordFieldTemp(input: self.$viewModel.user.password, textField: "Kata Sandi")
                .onChange(of: viewModel.user.password, perform: { password in
                    UserDefaults.standard.set(self.viewModel.user.password, forKey: "password")
                    print("Password changed to \(password)")
                })
            Spacer()
            SubmitLogin(showView: $showView, showAlert: $showAlert, action: {viewModel.checkIfAllFieldsFilled()})
            RegisterButton(showView: $showView2)
        }
        .padding()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
