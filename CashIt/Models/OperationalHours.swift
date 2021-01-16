//
//  OperationalHours.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation

struct OperationalHours: Identifiable {
    
    var id = UUID()
    let dayName: String
    var isOpen: Bool
    let openHour : String
    let closeHour: String
    
}
