//
//  Review.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct Review: Identifiable {
    
    var id = UUID()
    let rating: Int
    let description: String
    let date: String
    
}

