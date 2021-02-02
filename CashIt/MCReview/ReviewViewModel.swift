//
//  ReviewViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation


class ReviewViewModel {
    var reviews: [Review] = []
    var mean: Int = 0

    // Dummy Data
    init() {
        self.reviews.append(contentsOf: [
//            Review(by: "Kevin", rating: 3, description: "Staffnya ramah, pelayanan baik dan cepat", date: "20 Desember 2020"),
//            Review(by: "Yatno", rating: 4, description: "Pelayanan cepat walaupun banyak pembelinya", date: "2 Januari 2021"),
            Review(appointmentId: 0, rating: 3, description: "Staffnya ramah, pelayanan baik dan cepat", date: "20 Desember 2020", username: "Yatno"),
            Review(appointmentId: 1, rating: 4, description: "Pelayanan cepat walaupun banyak pembelinya", date: "2 Januari 2021", username: "Yatno"),
        ])
    }
    
    func getStoreRating() -> Int{
        for i in 0..<reviews.count {
            mean+=reviews[i].rating
        }
        mean = mean / reviews.count
        return mean
    }
    
    //        func load() {
    //            let url = URL(string: "https://gist.githubusercontent.com/rbreve/60eb5f6fe49d5f019d0c39d71cb8388d/raw/f6bc27e3e637257e2f75c278520709dd20b1e089/movies.json")!
    //
    //            URLSession.shared.dataTask(with: url) {(data,response,error) in
    //                do {
    //                    if let d = data {
    //                        let decodedMCReview = try JSONDecoder().decode([Review].self, from: d)
    //                        DispatchQueue.main.async {
    //                            self.reviews = decodedMCReview
    //                        }
    //                    }else {
    //                        print("No Data")
    //                    }
    //                } catch {
    //                    print ("Error")
    //                }
    //            }.resume()
    //        }
    //    <<--Setelah ini diupload ke dalam init dipanggil load() -->
}
