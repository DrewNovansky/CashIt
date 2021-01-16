//
//  User.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var username: String = UserDefaults.standard.string(forKey: "username") ?? ""
    var email: String = UserDefaults.standard.string(forKey: "email") ?? ""
    var password: String = UserDefaults.standard.string(forKey: "password") ?? ""
    var confPassword: String = UserDefaults.standard.string(forKey: "confpassword") ?? ""
}
