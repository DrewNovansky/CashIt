//
//  InfoViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation

class InfoViewModel{
    var operationalHours: [OfficeHour] = []
    var moneyChanger: MoneyChanger
    var distance: Double
    // Dummy Data
    init() {
        moneyChanger = MoneyChanger(moneyChangerId: 0, moneyChangerName: "Rainbow Bridge Money Changer", photo: "Test", address: "Jl.Raya Kb.Jeruk Gg.H. Salbini No.27 RT.1 RW.9",whatsappLink: "wa.me/6281291286046", phoneNumber: "081291286046",latitudeCoordinate:-6.2018528,longitudeCoordinate: 106.782557)
        distance = 0.02
        self.operationalHours.append(contentsOf: [
            OfficeHour(officeHourId: 0, day: "Monday",openTime: "0", closeTime: "0"),
            OfficeHour(officeHourId: 1, day: "Tuesday", openTime: "0", closeTime: "0"),
            OfficeHour(officeHourId: 2, day: "Wednesday", openTime: "0", closeTime: "0"),
            OfficeHour(officeHourId: 3, day: "Thursday", openTime: "10:00", closeTime: "0"),
            OfficeHour(officeHourId: 4, day: "Friday", openTime: "0", closeTime: "0"),
            OfficeHour(officeHourId: 5, day: "Saturday", openTime: "0", closeTime: "0"),
            OfficeHour(officeHourId: 6, day: "Sunday", openTime: "0", closeTime: "0")
        ])
    }
    
//            func load() {
//                let url = URL(string: "https://gist.githubusercontent.com/rbreve/60eb5f6fe49d5f019d0c39d71cb8388d/raw/f6bc27e3e637257e2f75c278520709dd20b1e089/movies.json")!
//
//                URLSession.shared.dataTask(with: url) {(data,response,error) in
//                    do {
//                        if let d = data {
//                            let decodedMCHour = try JSONDecoder().decode([OfficeHour].self, from: d)
//                            DispatchQueue.main.async {
//                                self.operationalHours = decodedMCHour
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
