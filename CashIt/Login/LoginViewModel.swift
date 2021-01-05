//
//  LoginViewModel.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var user = UserLogin()
    
    func checkIfAllFieldsFilled() -> Bool {
        if self.user.email.isEmpty || self.user.password.isEmpty {
            return false
        }
        
        return true
    }
}
