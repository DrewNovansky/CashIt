//
//  HomeViewModel.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation
import SwiftUI
import MapKit
class HomeViewModel: ObservableObject {
    var store: [MoneyChanger] = []
    var currency: [Currency] = []
    var distance: Double = 0
    var locValue: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0,longitude: 0)
    let locationManager = CLLocationManager()
    // Dummy Data
    init() {
        locValue = locationManager.location?.coordinate ?? CLLocationCoordinate2D()
        self.store.append(contentsOf: [
            MoneyChanger(moneyChangerName: "Rainbow Bridge Money Changer", photo: "Test", address: "Jl.Raya Kb.Jeruk Gg.H. Salbini No.27 RT.1 RW.9",whatsappLink: "wa.me/6281291286046", phoneNumber: "081291286046",latitudeCoordinate:-6.2018528,longitudeCoordinate: 106.782557),
            MoneyChanger(moneyChangerName: "Surya Money Changer",photo: "Test", address: "Central Park Mall Lantai B 30A",whatsappLink: "wa.me/6281243658709", phoneNumber: "081234658709",latitudeCoordinate:-6.1774,longitudeCoordinate: 106.7907),
            MoneyChanger(moneyChangerName: "Tiga Saudara Money Changer",photo: "Test", address: "Taman Anggrek Lantai 1 29B",whatsappLink: "wa.me/084681809919", phoneNumber: "084681809919",latitudeCoordinate:-6.1785,longitudeCoordinate: 106.7922),
        ])
        self.currency.append(contentsOf: [
            Currency(currencyName: "USD", buyPrice: 14050, sellPrice: 14100),
            Currency(currencyName: "EUR", buyPrice: 17200, sellPrice: 17330),
            Currency(currencyName: "GBP", buyPrice: 19010, sellPrice: 19200),
            Currency(currencyName: "CNY", buyPrice: 2165, sellPrice: 2180),
            Currency(currencyName: "HKD", buyPrice: 1795, sellPrice: 1815)
        ])
        
                store.sort {
                    countDistance(loc1Latitude: $0.latitudeCoordinate, loc1Longitude: $0.longitudeCoordinate) < countDistance(loc1Latitude: $1.latitudeCoordinate, loc1Longitude: $1.longitudeCoordinate)
//                                Price Sort implement price Currency first
//                                    && $0.storePrice < $1.storePrice
                }
    }
    func searchCurrency(currency: [Currency], currencySearchFor: Currency)-> Currency{
        var getCurrency: Currency = Currency(currencyName: "", buyPrice: 0, sellPrice: 0)
        for item in currency {
            if item.currencyName == currencySearchFor.currencyName{
                getCurrency.currencyName = item.currencyName
                getCurrency.buyPrice = item.buyPrice
                getCurrency.sellPrice = item.sellPrice
            }
        }
        return getCurrency
    }
    
    func countDistance(loc1Latitude: Double, loc1Longitude: Double) -> Double {
        let loc1 = CLLocation(latitude: loc1Latitude, longitude: loc1Longitude)
        let loc2 = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        distance = loc1.distance(from: loc2)
        distance = Double(round(100*distance)/100)
        return distance
    }
    
    func segue(showView: Binding<Bool>,distance: Double) -> MCProfileView {
        let viewModel = MCProfileViewModel()
        viewModel.distance = self.distance//terima parameter
        let view = MCProfileView(rootIsActive: showView)
        return view
    }
    
//        func load() {
//            let url = URL(string: "https://gist.githubusercontent.com/rbreve/60eb5f6fe49d5f019d0c39d71cb8388d/raw/f6bc27e3e637257e2f75c278520709dd20b1e089/movies.json")!
//    
//            URLSession.shared.dataTask(with: url) {(data,response,error) in
//                do {
//                    if let d = data {
//                        let decodedMC = try JSONDecoder().decode([MoneyChanger].self, from: d)
//                        let decodedCurrency = try JSONDecoder().decode([Currency].self, from: d)
//                        DispatchQueue.main.async {
//                            self.store = decodedMC
//                            self.currency = decodedCurrency
//                        }
//                    }else {
//                        print("No Data")
//                    }
//                } catch {
//                    print ("Error")
//                }
//
//            }.resume()
//        }
    //    <<--Setelah ini diupload ke dalam init dipanggil load() -->
}
