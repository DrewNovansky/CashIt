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
    var operationalHours: [OfficeHour] = []
    var moneyChanger: MoneyChanger
    var distance: Double
    var mean: Int = 0
    // Dummy Data
    init(){
        distance = 2000
        distance = Double(round(100*distance)/100)/1000
        
        moneyChanger = MoneyChanger(moneyChangerId: 3, moneyChangerName: "Rainbow Bridge Money Changer", photo: "Test", address: "Jl.Raya Kb.Jeruk Gg.H. Salbini No.27 RT.1 RW.9",whatsappLink: "wa.me/6281291286046", phoneNumber: "081291286046",latitudeCoordinate:-6.2018528,longitudeCoordinate: 106.782557)
        load()
        //        self.operationalHours.append(contentsOf: [
        //            OfficeHour(officeHourId: 0, day: "Monday", openTime: "0", closeTime: "0"),
        //            OfficeHour(officeHourId: 1, day: "Tuesday", openTime: "10:00", closeTime: "22:00"),
        //            OfficeHour(officeHourId: 2,day: "Wednesday", openTime: "10:00", closeTime: "22:00"),
        //            OfficeHour(officeHourId: 3,day: "Thursday", openTime: "10:00", closeTime: "22:00"),
        //            OfficeHour(officeHourId: 4,day: "Friday", openTime: "10:00", closeTime: "22:00"),
        //            OfficeHour(officeHourId: 5,day: "Saturday", openTime: "09:00", closeTime: "22:00"),
        //            OfficeHour(officeHourId: 6,day: "Sunday", openTime: "09:00", closeTime: "23:00")
        //        ])
        //
        //        self.currency.append(contentsOf: [
        //            Currency(currencyId: 0, currencyName: "USD", buyPrice: 14050, sellPrice: 14100),
        //            Currency(currencyId: 1,currencyName: "EUR", buyPrice: 17200, sellPrice: 17330),
        //            Currency(currencyId: 2,currencyName: "GBP", buyPrice: 19010, sellPrice: 19200),
        //            Currency(currencyId: 3,currencyName: "CNY", buyPrice: 2165, sellPrice: 2180),
        //            Currency(currencyId: 4,currencyName: "HKD", buyPrice: 1795, sellPrice: 1815)
        //        ])
        
        self.reviews.append(contentsOf: [
            Review(appointmentId: 0, rating: 2,  description: "Staffnya ramah, pelayanan baik dan cepat", date: "20 Desember 2020", username: "Yanto"),
            Review(appointmentId: 1, rating: 3, description: "Pelayanan cepat walaupun banyak pembelinya", date: "2 Januari 2021", username: "Yatno"),
        ])
    }
    
    func getStoreRating() -> Int{
        for i in 0..<reviews.count {
            mean+=reviews[i].rating
        }
        mean = mean / reviews.count
        return mean
    }
    
    func segueToInfo(moneyChangerTo: MoneyChanger, distance: Double) -> MCInfoView {
        let viewModel = InfoViewModel()//terima parameter
        viewModel.moneyChanger = moneyChangerTo
        viewModel.distance = distance
        let view = MCInfoView(viewModel: viewModel)
        return view
    }
    
    func segueToReview(review: [Review]) -> MCReviewView {
        let viewModel = ReviewViewModel()//terima parameter
        let view = MCReviewView(viewModel: viewModel)
        viewModel.reviews = review
        return view
    }
    
    func segueToMakeAppointment(showView: Binding<Bool>, moneyChanger: MoneyChanger) -> MCMakeAppointmentView {
        let viewModel = MCMakeAppointmentViewModel()//terima parameter
        let view = MCMakeAppointmentView(popToRootView: showView)
        viewModel.name = moneyChanger.moneyChangerName
        viewModel.moneyChangerId = moneyChanger.moneyChangerId
        return view
    }
    
    func openWA() -> URL{
        let url = URL(string: "https://\(moneyChanger.whatsappLink)")!
        return url
    }
    
    func load() {
        
        //        GET Currency API
        let url = URL(string: "http://cashit.link/api/getCurrencyByMoneyChangerId")!
        let body: [String: Int] = ["moneyChangerId" : 3]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        request.httpBody = finalBody
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                if let data = data {
                    let decodedMC = try JSONDecoder().decode([Currency].self, from: data)
                    DispatchQueue.main.async {
                        self.currency = decodedMC
                    }
                }else {
                    print("No Data\n\n")
                }
            } catch {
                print ("Error\n\n")
            }
        }.resume()
        let url2 = URL(string: "http://cashit.link/api/getOfficeHourByMoneyChangerId")!
        
        let finalBody2 = try! JSONSerialization.data(withJSONObject: body)
        
        //       GET Office Hour API
        var request2 = URLRequest(url: url2)
        request2.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request2.httpMethod = "GET"
        request2.httpBody = finalBody2
        URLSession.shared.dataTask(with: request2) { data2, response, error in
            guard let data2 = data2
            else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            let finalData2 = try! JSONDecoder().decode([OfficeHour].self, from: data2)
            print("\(finalBody2)")
            print("\(finalData2) ini final data \n\n\n\n\n\n ")
            DispatchQueue.main.async {
                self.operationalHours = finalData2
            }
        }.resume()
        
        //        GET Review API
        let url3 = URL(string: "http://cashit.link/api/getAllReviewsByMoneyChangerId")!
        
        let finalBody3 = try! JSONSerialization.data(withJSONObject: body)
        
        var request3 = URLRequest(url: url3)
        request3.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request3.httpMethod = "GET"
        request3.httpBody = finalBody3
        URLSession.shared.dataTask(with: request3) { data3, response, error in
            // handle the result here.
            guard let data3 = data3
            else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            let finalData3 = try! JSONDecoder().decode([Review].self, from: data3)
            print("\(finalBody3)")
            print("\(finalData3) ini final data \n\n\n\n\n\n ")
            DispatchQueue.main.async {
                self.reviews = finalData3
            }
        }.resume()
    }
}
