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
        load()
    }
    
    
    func load() {
        let url = URL(string: "http://cashit.link/api/getAppointmentByUserId/\(UserDefaults.standard.integer(forKey: "userId"))")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
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
    
    func segueToOrderDetail(history: Appointment) -> OrderDetailView {
        let viewModel = OrderDetailViewModel()//terima parameter
        viewModel.appointment = history
        let view = OrderDetailView(viewModel: viewModel)
        return view
    }
}
