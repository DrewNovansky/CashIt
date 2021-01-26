//
//  RegisterViewModel.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var user = User()
    
    func checkIfAllFieldsFilled() -> Bool {
        if self.user.username.isEmpty || self.user.email.isEmpty || self.user.password.isEmpty || self.user.confPassword.isEmpty || self.user.password != self.user.confPassword{
            print("\(user.username) and \(user.password)")
            return false
            
        }
        print("\(user.username) and \(user.password)")
        return true
    }
    func segueToLogin() -> LoginView {
        let view = LoginView()
        return view
    }
//    func createLoginData(<#parameters#>){
//        return user
//    }
}
