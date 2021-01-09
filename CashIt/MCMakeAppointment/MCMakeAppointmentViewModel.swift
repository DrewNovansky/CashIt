//
//  MCMakeAppintmentViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 09/01/21.
//

import Foundation


class MCMakeAppointmentViewModel: ObservableObject{
    
    let currentDate = Date()
    
    var name : String = "Maju Jaya Money Changer"
    @Published var appoinmentFrom : String = ""
    @Published var appoinmentFromPrice : Int = 0
    @Published var appoinmentTo : String = ""
    @Published var appoinmentToPrice : Int = 0
    @Published var appoinmentDate: Date = Date()
    @Published var appoinmentTime: Date = Date()
    
    
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
