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
    var moneyChanger: MoneyChanger
    var distance: Double = 20
    var wa : String = "089633732603"
    
    // Dummy Data
    init(){
        
        moneyChanger = MoneyChanger(moneyChangerName: "MonasMC", photo: "Test", address: "", whatsappLink: "wa.me", phoneNumber: "081291286046", latitudeCoordinate: -6.175498079151794, longitudeCoordinate: 106.82726958474876, distance: self.distance)
        self.currency.append(contentsOf: [
            Currency(currencyName: "USD", buyPrice: 14165, sellPrice: 14195),
            Currency(currencyName: "SGD", buyPrice: 10601, sellPrice: 10632),
            Currency(currencyName: "THB", buyPrice: 467, sellPrice: 475),
            Currency(currencyName: "JPY", buyPrice: 135, sellPrice: 138),
            Currency(currencyName: "KRW", buyPrice: 14150, sellPrice: 14180)
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
