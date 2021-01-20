//
//  Review.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct Review: Decodable,Identifiable {
    
    var id = UUID()
    var rating: Int
    var description: String
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case rating = "rating"
        case description = "description"
        case date = "date"
    }
    
}

