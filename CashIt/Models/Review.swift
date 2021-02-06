//
//  Review.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 16/01/21.
//

import Foundation

struct Review: Decodable,Identifiable {
    var id = UUID()
    var appointmentId: Int
    var rating: Int
    var description: String
    var date: String
    var username: String
    enum CodingKeys: String, CodingKey {
        case appointmentId = "appointmentId"
        case username = "userName"
        case rating = "rating"
        case description = "description"
        case date = "date"
    }
    
}

