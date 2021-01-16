//
//  UserRegister.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation

struct UserRegister: Identifiable {
    var id = UUID()
    var username: String = UserDefaults.standard.string(forKey: "username") ?? ""
    var email: String = UserDefaults.standard.string(forKey: "email") ?? ""
    var password: String = UserDefaults.standard.string(forKey: "password") ?? ""
    var confPassword: String = UserDefaults.standard.string(forKey: "confpassword") ?? ""
}
