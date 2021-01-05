//
//  ReviewViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import Foundation

class ReviewViewModel {
    var reviews: [Reviews] = []
    
    var mean: Int = 0
    
    // Dummy Data
    init() {
        self.reviews.append(contentsOf: [
            Reviews(rating: 4, userName: "Summer", date: "20/09/20", description: "Cool Bingit"),
            Reviews(rating: 1, userName: "Winter", date: "30/10/20", description: "Lama banget kerjanya, ngantri sampai 2 jam"),
            Reviews(rating: 5, userName: "Autumn", date: "1/11/20", description: "Ramah Beut orangnya, dikasih bonus lagi"),
            Reviews(rating: 4, userName: "Spring", date: "20/12/20", description: "Bakal sering-sering nukar disini sih"),
            Reviews(rating: 1, userName: "Joko", date: "20/12/20", description: "Tempatnya pengap bgt, malah di sebrangnya ada kali bau bgt")
        ])
    }
    
    func getStoreRating() -> Int{
        for i in 0..<reviews.count {
            mean+=reviews[i].rating
        }
        mean = mean / reviews.count
        return mean
    }
    
    func getReview(index: Int) -> Reviews {
        return reviews[index]
    }
}
