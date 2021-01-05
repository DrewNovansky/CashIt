//
//  Reviews.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation

struct Reviews: Identifiable {
    
    var id = UUID()
    let rating: Int
    let userName: String
    let date: String
    let description: String
    
}
