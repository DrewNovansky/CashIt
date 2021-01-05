//
//  UserLogin.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation

class UserLogin: Identifiable{
    var id = UUID()
    var email: String = UserDefaults.standard.string(forKey: "email") ?? ""
    var password: String = UserDefaults.standard.string(forKey: "password") ?? ""
}
