//
//  InfoViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation

class InfoViewModel{
    var operationalHours: [OperationalHours] = []
    
    var name : String = "Maju Jaya Money Changer"
    var wa : String = "081234567890"
    var address: String = "Jl. Doang Jadian Kaga Blok AQ No.4, Rawa Belong, Jakarta Barat, 11270"
    
    // Dummy Data
    init() {
        self.operationalHours.append(contentsOf: [
            OperationalHours(dayName: "Monday", isOpen: false, openHour: "0", closeHour: "0"),
            OperationalHours(dayName: "Tuesday", isOpen: true, openHour: "10:00", closeHour: "22:00"),
            OperationalHours(dayName: "Wednesday", isOpen: true, openHour: "10:00", closeHour: "22:00"),
            OperationalHours(dayName: "Thursday", isOpen: true, openHour: "10:00", closeHour: "22:00"),
            OperationalHours(dayName: "Friday", isOpen: true, openHour: "10:00", closeHour: "22:00"),
            OperationalHours(dayName: "Saturday", isOpen: true, openHour: "09:00", closeHour: "22:00"),
            OperationalHours(dayName: "Sunday", isOpen: true, openHour: "09:00", closeHour: "23:00")
        ])
    }
    
    func getOperationalHours(index: Int) -> OperationalHours {
        return operationalHours[index]
    }
}
