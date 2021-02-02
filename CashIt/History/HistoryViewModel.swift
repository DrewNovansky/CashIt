//
//  HistoryViewModel.swift
//  CashIt
//
//  Created by Sherwin Yang on 07/12/20.
//

import Foundation

struct HistoryDetail: Codable{
    struct MoneyChanger: Codable {
        var moneyChangerId: Int
        var moneyChangerName: String
        var photo: String
        var address: String
        var whatsappLink: String
        var phoneNumber: String
        var latitudeCoordinate: Double
        var longitudeCoordinate: Double
        private enum CodingKeys : String, CodingKey {
            case moneyChangerId = "id"
            case moneyChangerName = "name"
            case photo = "photo"
            case address = "address"
            case whatsappLink = "whatsAppLink"
            case phoneNumber = "phoneNumber"
            case latitudeCoordinate = "latitudeCoordinate"
            case longitudeCoordinate = "longitudeCoordinate"
        }
    }
    struct History: Codable{
        var appointmentId: Int
        var orderNumber: String
        var status: String
        var date: String
        var time: String
        var toReceiveAmount: Int
        var toReceiveCurrencyName: String
        var toExchangeAmount: Int
        var toExchangeCurrencyName: String
        private enum CodingKeys : String, CodingKey {
            case appointmentId = "id"
            case orderNumber = "orderNumber"
            case status = "status"
            case date = "date"
            case time = "time"
            case toReceiveAmount = "toReceiveAmount"
            case toReceiveCurrencyName = "toReceiveCurrencyName"
            case toExchangeAmount = "toExchangeAmount"
            case toExchangeCurrencyName = "toExchangeCurrencyName"
        }
    }
    let MoneyChanger: MoneyChanger
    let History: History
}

class HistoryViewModel {
    var appointment: [Appointment] = []
    var moneyChanger: [MoneyChanger] = []
    // Dummy Data
    
    init() {
        self.appointment.append(contentsOf: [
            Appointment(moneyChangerId: 0, moneyChangerName: "Rainbow Bridge Money Changer", address: "Jl.Raya Kb.Jeruk Gg.H. Salbini No.27 RT.1 RW.9",orderNumber: "190120001", status: "Waiting", date: "29/05/2020", time: "18:00", toReceiveAmount: 1400000, toReceiveCurrencyName: "IDR", toExchangeAmount: 100, toExchangeCurrencyName: "USD"),
            Appointment(moneyChangerId: 1, moneyChangerName: "Surya Money Changer", address: "Central Park Mall Lantai B 30A", orderNumber: "190120002", status: "Waiting", date: "28/05/2020", time: "18:00", toReceiveAmount: 700000, toReceiveCurrencyName: "IDR", toExchangeAmount: 50, toExchangeCurrencyName: "USD"),
            Appointment(moneyChangerId: 2, moneyChangerName: "Surya Money Changer", address: "Central Park Mall Lantai B 30A", orderNumber: "190120003", status: "Waiting", date: "26/05/2020", time: "18:00", toReceiveAmount: 720000, toReceiveCurrencyName: "IDR", toExchangeAmount: 50, toExchangeCurrencyName: "USD")
        ])
    }
    
    
                func load() {
                    let url = URL(string: "http://cashit.link/api/getAppointmentByUserId")!
                    let body: [String: Int] = ["userId" : UserDefaults.standard.integer(forKey: "userId")]
                    let finalBody = try! JSONSerialization.data(withJSONObject: body)
                    var request = URLRequest(url: url)
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.httpMethod = "GET"
                    request.httpBody = finalBody
                    URLSession.shared.dataTask(with: request) { (data, response, error) in
                        do {
                            if let data = data {
                                let decodedList = try JSONDecoder().decode([Appointment].self, from: data)
                                DispatchQueue.main.async {
                                    self.appointment = decodedList
                                }
                            }else {
                                print("No Data\n\n")
                            }
                        } catch {
                            print ("Error\n\n")
                        }
                    }.resume()
                }
    //    <<--Setelah ini diupload ke dalam init dipanggil load() -->
    
    func segueToOrderDetail() -> OrderDetailView {
        let viewModel = OrderDetailViewModel()//terima parameter
        viewModel.appointment.moneyChangerName = "TestPasing"
        let view = OrderDetailView(viewModel: viewModel)
        return view
    }
}
