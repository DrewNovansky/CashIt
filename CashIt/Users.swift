//
//  User.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation

struct User: Identifiable {
    
    var id = UUID()
    let name: String
    let email: String
    let password: String

}
