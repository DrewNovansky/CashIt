//
//  GiveRatingAndReviewViewModel.swift
//  CashIt
//
//  Created by Sherwin Yang on 07/12/20.
//

import Foundation

class GiveRatingAndReviewViewModel: ObservableObject {
    @Published var review = NewReview(rating: 0, description: "")
    
    func checkIfAllFieldsFilled() -> Bool {
        if self.review.description.isEmpty || self.review.rating == 0 {
            return false
        }
        
        return true
    }
}
