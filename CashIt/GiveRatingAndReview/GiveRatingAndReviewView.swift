//
//  GiveRatingAndReviewView.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct GiveRatingAndReviewView: View {
    @State var review: String = ""
    @State var rating: Int = 0
    
    var body: some View {
        Text("How many star(s) would you rate this transaction")
            .padding()
            .multilineTextAlignment(.center)
            .frame(width: UIScreen.main.bounds.width*0.5)
        
        StarsRating(rating: $rating)
        ReviewTextField(review: $review)
        SubmitButton()
            .padding()
    }
}

struct GiveRatingAndReviewView_Previews: PreviewProvider {
    static var previews: some View {
        GiveRatingAndReviewView()
    }
}
