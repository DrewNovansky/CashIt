//
//  HistoryViewModel.swift
//  CashIt
//
//  Created by Sherwin Yang on 07/12/20.
//

import Foundation

class HistoryViewModel {
    var appointment: [Appointment] = []
    
    // Dummy Data
    init() {
        self.appointment.append(contentsOf: [
            Appointment(orderNumber: "190120001", status: "Waiting", date: "29/05/2020", time: "18:00", toReceiveAmount: 1400000, toReceiveCurrencyName: "USD", toExchangeAmount: 100, toExchangeCurrencyName: "IDR"),
            Appointment(orderNumber: "190120002", status: "Waiting", date: "28/05/2020", time: "18:00", toReceiveAmount: 700000, toReceiveCurrencyName: "USD", toExchangeAmount: 50, toExchangeCurrencyName: "IDR"),
            Appointment(orderNumber: "190120003", status: "Waiting", date: "26/05/2020", time: "18:00", toReceiveAmount: 720000, toReceiveCurrencyName: "USD", toExchangeAmount: 50, toExchangeCurrencyName: "IDR")
        ])
    }
    
    //
    //            func load() {
    //                let url = URL(string: "https://gist.githubusercontent.com/rbreve/60eb5f6fe49d5f019d0c39d71cb8388d/raw/f6bc27e3e637257e2f75c278520709dd20b1e089/movies.json")!
    //
    //                URLSession.shared.dataTask(with: url) {(data,response,error) in
    //                    do {
    //                        if let d = data {
    //                            let decodedAppointment = try JSONDecoder().decode([Appointment].self, from: d)
    //                            DispatchQueue.main.async {
    //                                self.appointment = decodedAppointment
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
    
    func segueToOrderDetail() -> OrderDetailView {
        let viewModel = OrderDetailViewModel()//terima parameter
        let view = OrderDetailView(viewModel: viewModel)
        return view
    }
}
