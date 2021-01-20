//
//  LoginViewModel.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var user = User()
    
    func checkIfAllFieldsFilled() -> Bool {
        if self.user.email.isEmpty || self.user.password.isEmpty {
            return false
        }
        return true
    }
    func segueToMainView(showView: Binding<Bool>) -> TabBarView {
        let view = TabBarView(rootIsActive: showView)
        return view
    }
    
//    func checkLogin(<#parameters#>){
//        return user
//    }
}
