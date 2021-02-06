//
//  MCMakeAppintmentViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 09/01/21.
//

import Foundation
import SwiftUI

class MCMakeAppointmentViewModel: ObservableObject{
    
    //    var currency: [Currency]
    let currentDate = Date()
    //ini dimasukkin class diagram
    var name : String
    var address : String
    var moneyChangerId: Int
    @Published var appoinmentFrom : String = ""
    @Published var appoinmentFromPrice : Int = 0
    @Published var appoinmentTo : String = ""
    @Published var appoinmentToPrice : Int = 0
    @Published var appoinmentDate: Date = Date()
    @Published var appoinmentTime: Date = Date()
    
    init() {
        moneyChangerId = 0
        name = ""
        address = ""
        //        currency.append(contentsOf: [
        //            Currency(currencyName: "USD", buyPrice: 14060, sellPrice: 14020),
        //            Currency(currencyName: "THB", buyPrice: 480, sellPrice: 460),
        //        ])
        
    }
    
    //    func dateValidation() -> Bool{
    //        if appoinmentDate < currentDate {
    //            return false
    //        }else {
    //            return true
    //        }
    //    }
    
    //    func segueToUserProfile() -> UserProfileView {
    //        let viewModel = UserProfileViewModel()//terima parameter
    //        let view = UserProfileView(viewModel: viewModel, rootIsActive: .constant(false))
    //        return view
    //    }
    
    func calculateCurrency(calculateFor: String, buyName: String, buyPrice: Int, sellName: String, sellPrice: Int, buyField: Int, sellField: Int)-> Int {
        var buyField: Int = 0
        var sellField: Int = 0
        if calculateFor == "buy" {
            let price = sellField/sellPrice*buyPrice
            buyField = price
            return buyField
        }
        if calculateFor == "sell" {
            sellField = buyField/buyPrice*sellPrice
            return sellField
        }
        return buyField
    }
    
    func makeAppointment(moneyChangerName: String, address: String, id: Int, orderNumber: String, status: String, date: String, time: String, toExchangeAmount: Int, toExchangeCurrencyName: String, toReceiveAmount: Int, toReceiveCurrencyName: String){
                let url = URL(string: "http://cashit.link/api/makeNewAppointment")!
                let body: [String: Any] = ["moneyChangerName": moneyChangerName, "address": address, "id": id, "orderNumber": orderNumber, "status": status, "date": date, "time": time, "toExchangeAmount": toExchangeAmount, "toExchangeCurrencyName": toExchangeCurrencyName, "toReceiveAmount": toReceiveAmount, "toReceiveCurrencyName": toReceiveCurrencyName]
        
                let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = finalBody
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data, error == nil else {
                        print(error?.localizedDescription ?? "No data")
                        return
                    }
                    let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                    if let responseJSON = responseJSON as? [String: Any] {
                        print("\(responseJSON) ini responseJSON\n\n\n\n\n\n\n")
                    }
                }
                task.resume()
    }
    
//    func load(appointment: Appointment) {
//        
//    }
    //    <<--Setelah ini diupload ke dalam init dipanggil load() -->
}
