//
//  MCMakeAppintmentViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 09/01/21.
//

import Foundation
import SwiftUI

class MCMakeAppointmentViewModel: ObservableObject{
    
    let currentDate = Date()
    var appointment: Appointment
    var name : String = "Maju Jaya Money Changer"
    @Published var appoinmentFrom : String = ""
    @Published var appoinmentFromPrice : Int = 0
    @Published var appoinmentTo : String = ""
    @Published var appoinmentToPrice : Int = 0
    @Published var appoinmentDate: Date = Date()
    @Published var appoinmentTime: Date = Date()
    
    init() {
        self.appointment = Appointment(orderNumber: "2001002", status: "Waiting", date: "20-Januari-2021", time: "19:00:00", toExchangeAmount: 500)
    }
    func dateValidation() -> Bool{
        if appoinmentDate < currentDate {
            
            return false
        }else {
            
            return true
        }
    }
    
    func segueToUserProfile() -> UserProfileView {
        let viewModel = UserProfileViewModel()//terima parameter
        let view = UserProfileView(viewModel: viewModel)
        return view
    }
}
