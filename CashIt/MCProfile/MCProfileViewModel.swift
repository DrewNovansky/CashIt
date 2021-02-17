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
        //        distance = Double(round(100*distance)/100)/1000
        moneyChanger = MoneyChanger(moneyChangerId: 3, moneyChangerName: "Testing", photo: "Test", address: "alamat init",whatsappLink: "wa.me/6281291286046", phoneNumber: "081291286046",latitudeCoordinate:-6.2018528,longitudeCoordinate: 106.782557)
        load()
    }
    
    func getStoreRating() -> Int{
        for i in 0..<reviews.count {
            mean+=reviews[i].rating
        }
        if (reviews.count != 0){
            mean = mean / reviews.count
        }
        else {mean = 0}
        return mean
    }
    
    func segueToInfo(operationalHours: [OfficeHour], distance: Double) -> MCInfoView {
        let viewModel = InfoViewModel()//terima parameter
        viewModel.moneyChanger = moneyChanger
        viewModel.operationalHours = operationalHours
        viewModel.distance = distance
        let view = MCInfoView(viewModel: viewModel)
        return view
    }
    
    func segueToReview(review: [Review]) -> MCReviewView {
        let viewModel = ReviewViewModel()//terima parameter
        viewModel.reviews = review
        let view = MCReviewView(viewModel: viewModel)
        return view
    }
    
    func segueToMakeAppointment(showView: Binding<Bool>, moneyChanger: MoneyChanger) -> MCMakeAppointmentView {
        let viewModel = MCMakeAppointmentViewModel()//terima parameter
        viewModel.name = moneyChanger.moneyChangerName
        viewModel.moneyChangerId = moneyChanger.moneyChangerId
        viewModel.address = moneyChanger.address
        viewModel.currency.append(contentsOf: currency)
        let view = MCMakeAppointmentView(viewModel: viewModel, popToRootView: showView)
        return view
    }
    
    func openWA() -> URL{
        let url = URL(string: "https://\(moneyChanger.whatsappLink)")!
        return url
    }
    
    func load() {
        
        //        GET Currency API
        let url = URL(string: "http://cashit.link/api/getCurrencyByMoneyChangerId/\(moneyChanger.moneyChangerId)")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let decodedMCCurrency = try JSONDecoder().decode([Currency].self, from: data)
                    DispatchQueue.main.async {
                        self.currency = decodedMCCurrency
                        print(decodedMCCurrency)
                    }
                }else {
                    print("No Data\n\n")
                }
            } catch {
                print ("Error data1\n\n")
            }
        }.resume()
        let url2 = URL(string: "http://cashit.link/api/getOfficeHourByMoneyChangerId/\(moneyChanger.moneyChangerId)")!
        
        //       GET Office Hour API
        
        URLSession.shared.dataTask(with: url2) { (data2, response, error) in
            do {
                if let data2 = data2 {
                    let decodedOfficeHour = try JSONDecoder().decode([OfficeHour].self, from: data2)
                    DispatchQueue.main.async {
                        self.operationalHours = decodedOfficeHour
                        print(decodedOfficeHour)
                    }
                }else {
                    print("No Data\n\n")
                }
            } catch {
                print ("Error data2\n\n")
            }
        }.resume()
        
        //        GET Review API
                let url3 = URL(string: "http://cashit.link/api/getAllReviewsByMoneyChangerId/\(self.moneyChanger.moneyChangerId)")!
                URLSession.shared.dataTask(with: url3) { (data3, response, error) in
                    // handle the result here.
                    do {
                        if let data3 = data3 {
                            let decodedReview = try JSONDecoder().decode([Review].self, from: data3)
                            DispatchQueue.main.async {
                                self.reviews = decodedReview
                            }
                        }else {
                            print("No Data\n\n")
                        }
                    } catch {
                        print ("Error data3\n\n")
                    }
                }.resume()
    }
}
