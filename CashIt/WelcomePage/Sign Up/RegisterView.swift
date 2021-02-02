//
//  RegisterView.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 24/11/20.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    @State var showView = false
    @State var showAlert = false
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                TitleTemp(text: "Daftar")
                Spacer()
            }
            Spacer()
            TextFieldTemp(input: $viewModel.user.username, textField: "Nama")
//                .onChange(of: viewModel.user.username, perform: { username in
//                    UserDefaults.standard.set(self.viewModel.user.username, forKey: "username")
//                })
            TextFieldTemp(input: $viewModel.user.email, textField: "Email")
//                .onChange(of: viewModel.user.email, perform: { email in
//                    UserDefaults.standard.set(self.viewModel.user.email, forKey: "email")
//                })
            PasswordFieldTemp(input: $viewModel.user.password, textField: "Kata Sandi")
//                .onChange(of: viewModel.user.password, perform: { password in
//                    UserDefaults.standard.set(self.viewModel.user.password, forKey: "password")
//                })
            PasswordFieldTemp(input: $viewModel.user.confPassword, textField: "Konfirmasi Kata Sandi")
//                .onChange(of: viewModel.user.confPassword, perform: { confPassword in
//                    UserDefaults.standard.set(self.viewModel.user.confPassword, forKey: "confpassword")
//                })
            Spacer()
            SubmitRegister(showView: $showView, showAlert: $showAlert, action: {viewModel.checkIfAllFieldsFilled()})
            
        }.frame(width: UIScreen.main.bounds.width - 20)
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
