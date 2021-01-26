//
//  MCMakeAppintmentViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 09/01/21.
//

import Foundation
import SwiftUI

class MCMakeAppointmentViewModel: ObservableObject{
    
    var appointment: Appointment
//    var currency: [Currency]
    let currentDate = Date()
    var name : String = "Maju Jaya Money Changer"
    @Published var appoinmentFrom : String = ""
    @Published var appoinmentFromPrice : Int = 0
    @Published var appoinmentTo : String = ""
    @Published var appoinmentToPrice : Int = 0
    @Published var appoinmentDate: Date = Date()
    @Published var appoinmentTime: Date = Date()
    
    init() {
//        currency.append(contentsOf: [
//            Currency(currencyName: "USD", buyPrice: 14060, sellPrice: 14020),
//            Currency(currencyName: "THB", buyPrice: 480, sellPrice: 460),
//        ])
        self.appointment = Appointment (orderNumber: "2001002", status: "Waiting", date: "20-Januari-2021", time: "19:00:00", toReceiveAmount: 14000, toReceiveCurrencyName: "USD", toExchangeAmount: 15000, toExchangeCurrencyName: "IDR")
    }
    
    func dateValidation() -> Bool{
        if appoinmentDate < currentDate {
            return false
        }else {
            return true
        }
    }
    
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
    
    func makeAppointment() {
        
    }
    
    //            func load() {
    //                let url = URL(string: "https://gist.githubusercontent.com/rbreve/60eb5f6fe49d5f019d0c39d71cb8388d/raw/f6bc27e3e637257e2f75c278520709dd20b1e089/movies.json")!
    //
    //                URLSession.shared.dataTask(with: url) {(data,response,error) in
    //                    do {
    //                        if let d = data {
    //                            let decodedCurrency = try JSONDecoder().decode([Currency].self, from: d)
    //                            DispatchQueue.main.async {
    //                                self.currency = decodedCurrency
    //                            }
    //                        }else {
    //                            print("No Data")
    //                        }
    //                    } catch {
    //                        print ("Error")
    //                    }
    //                }.resume()
    //            }
    //    <<--Setelah ini diupload ke dalam init dipanggil load() -->
}
