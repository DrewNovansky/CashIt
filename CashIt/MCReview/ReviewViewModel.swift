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
            Review(rating: 4, description: "Cool Bingit", date: "20/09/20"),
            Review(rating: 1, description: "Lama banget kerjanya, ngantri sampai 2 jam", date: "30/10/20"),
            Review(rating: 5, description: "Ramah Beut orangnya, dikasih bonus lagi", date: "1/11/20"),
            Review(rating: 4, description: "Bakal sering-sering nukar disini sih", date: "20/12/20"),
            Review(rating: 1, description: "Tempatnya pengap bgt, malah di sebrangnya ada kali bau bgt", date: "20/12/20")
//            Review(rating: 4, userName: "Summer", date: "20/09/20", description: "Cool Bingit"),
//            Review(rating: 1, userName: "Winter", date: "30/10/20", description: "Lama banget kerjanya, ngantri sampai 2 jam"),
//            Review(rating: 5, userName: "Autumn", date: "1/11/20", description: "Ramah Beut orangnya, dikasih bonus lagi"),
//            Review(rating: 4, userName: "Spring", date: "20/12/20", description: "Bakal sering-sering nukar disini sih"),
//            Review(rating: 1, userName: "Joko", date: "20/12/20", description: "Tempatnya pengap bgt, malah di sebrangnya ada kali bau bgt")
        ])
    }
    
    func getStoreRating() -> Int{
        for i in 0..<reviews.count {
            mean+=reviews[i].rating
        }
        mean = mean / reviews.count
        return mean
    }
    
    func getReview(index: Int) -> Review {
        return reviews[index]
    }
}
