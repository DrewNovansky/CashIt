//
//  GiveRatingAndReviewView.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct GiveRatingAndReviewView: View {
    @ObservedObject var viewModel = GiveRatingAndReviewViewModel()
    
    var body: some View {
        VStack{
        Text("Berapa bintang untuk pesanan ini")
            .onTapGesture(perform: {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            })
            .padding()
            .multilineTextAlignment(.center)
            .frame(width: UIScreen.main.bounds.width*0.5)
        StarsRating(rating: $viewModel.review.rating)
            .padding()
        ReviewTextField(review: $viewModel.review.description)
            .padding()
        SubmitButton(action: {viewModel.checkIfAllFieldsFilled()})
            .padding()
        }.onTapGesture(perform: {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        })
        .foregroundColor(.black)
    }
}

struct GiveRatingAndReviewView_Previews: PreviewProvider {
    static var previews: some View {
        GiveRatingAndReviewView()
    }
}
