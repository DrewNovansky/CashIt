//
//  InfoViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation

class InfoViewModel{
    var operationalHours: [OfficeHour] = []
    
    var name : String = "Maju Jaya Money Changer"
    var wa : String = "081234567890"
    var address: String = "Jl. Doang Jadian Kaga Blok AQ No.4, Rawa Belong, Jakarta Barat, 11270"
    
    // Dummy Data
    init() {
        self.operationalHours.append(contentsOf: [
            OfficeHour(day: "Monday",openTime: "0", closeTime: "0"),
            OfficeHour(day: "Tuesday", openTime: "10:00", closeTime: "22:00"),
            OfficeHour(day: "Wednesday", openTime: "10:00", closeTime: "22:00"),
            OfficeHour(day: "Thursday", openTime: "10:00", closeTime: "22:00"),
            OfficeHour(day: "Friday", openTime: "10:00", closeTime: "22:00"),
            OfficeHour(day: "Saturday", openTime: "09:00", closeTime: "22:00"),
            OfficeHour(day: "Sunday", openTime: "09:00", closeTime: "23:00")
        ])
    }
    
    func getOperationalHours(index: Int) -> OfficeHour {
        return operationalHours[index]
    }
}
