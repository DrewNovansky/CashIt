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
    var reviews: [Review] = []
    var moneyChanger: MoneyChanger
    var distance: Double = 20
    var mean: Int = 0
    // Dummy Data
    init(){
        moneyChanger = MoneyChanger(moneyChangerName: "Rainbow Bridge Money Changer", photo: "Test", address: "Jl.Raya Kb.Jeruk Gg.H. Salbini No.27 RT.1 RW.9",whatsappLink: "wa.me/6281291286046", phoneNumber: "081291286046",latitudeCoordinate:-6.2018528,longitudeCoordinate: 106.782557)
        
        self.currency.append(contentsOf: [
            Currency(currencyName: "USD", buyPrice: 14050, sellPrice: 14100),
            Currency(currencyName: "EUR", buyPrice: 17200, sellPrice: 17330),
            Currency(currencyName: "GBP", buyPrice: 19010, sellPrice: 19200),
            Currency(currencyName: "CNY", buyPrice: 2165, sellPrice: 2180),
            Currency(currencyName: "HKD", buyPrice: 1795, sellPrice: 1815)
        ])
        self.reviews.append(contentsOf: [
            Review(rating: 3, description: "Staffnya ramah, pelayanan baik dan cepat", date: "20 Desember 2020"),
            Review(rating: 4, description: "Pelayanan cepat walaupun banyak pembelinya", date: "2 Januari 2021"),
        ])
    }
    
    func getStoreRating() -> Int{
        for i in 0..<reviews.count {
            mean+=reviews[i].rating
        }
        mean = mean / reviews.count
        return mean
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
        let url = URL(string: "https://\(moneyChanger.whatsappLink)")!
        return url
    }
    
    //
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
