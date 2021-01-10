//
//  MoneyViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation
import SwiftUI
class MCProfileViewModel{
    var currency: [Currency] = []
    var review = ReviewViewModel()
    
    var name : String = "Maju Jaya Money Changer"
    var wa : String = "089633732603"
    
    // Dummy Data
    init(){
        self.currency.append(contentsOf: [
            Currency(priceName: "USD", priceBuy: 14165, priceSell: 14195),
            Currency(priceName: "SGD", priceBuy: 10601, priceSell: 10632),
            Currency(priceName: "THB", priceBuy: 467, priceSell: 475),
            Currency(priceName: "JPY", priceBuy: 135, priceSell: 138),
            Currency(priceName: "KRW", priceBuy: 14150, priceSell: 14180)
        ])
    }
    
    func getPrices(index: Int) -> Currency {
        return currency[index]
    }
    
    func segueToInfo() -> MCInfoView {
        let viewModel = InfoViewModel()//terima parameter
        let view = MCInfoView(viewModel: viewModel)
        return view
    }
    
    func segueToReview() -> MCReviewView {
        let viewModel = ReviewViewModel()//terima parameter
        let view = MCReviewView(viewModel: viewModel)
        return view
    }
    
    func segueToMakeAppointment(showView: Binding<Bool>) -> MCMakeAppointmentView {
        let viewModel = MCMakeAppointmentViewModel()//terima parameter
        let view = MCMakeAppointmentView(popToRootView: showView)
        return view
    }
    
    func openWA() -> URL{
        let url = URL(string: "https://wa.me/\(wa)")!
        return url
    }
}
