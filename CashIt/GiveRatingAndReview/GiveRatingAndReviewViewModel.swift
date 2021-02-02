//
//  GiveRatingAndReviewViewModel.swift
//  CashIt
//
//  Created by Sherwin Yang on 07/12/20.
//

import Foundation

class GiveRatingAndReviewViewModel: ObservableObject {
    @Published var review = Review( appointmentId: 0, rating: 0,  description: "", date: "*DATE*", username: "yatno")
    
    func checkIfAllFieldsFilled() -> Bool {
        if self.review.description.isEmpty || self.review.rating == 0 {
            return false
        }
        return true
    }
    //    func makeReview(){
    //
    //    }
}
