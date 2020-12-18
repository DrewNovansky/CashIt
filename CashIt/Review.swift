//
//  Review.swift
//  CashIt
//
//  Created by Sherwin Yang on 16/12/20.
//

import Foundation

struct Review: Identifiable {
    var id = UUID()
    var rating: Int
    var description: String
}
