//
//  GiveRatingAndReviewViewModel.swift
//  CashIt
//
//  Created by Sherwin Yang on 07/12/20.
//

import Foundation

class GiveRatingAndReviewViewModel: ObservableObject {
    @Published var review = Review( appointmentId: 0, rating: 0,  description: "", date: "*DATE*", username: "yatno")
    
    func checkIfAllFieldsFilled(appointmentId: Int, rating: Int, description: String) -> Bool {
        if self.review.description.isEmpty || self.review.rating == 0 {
            return false
        }
        else{
            makeReview(appointmentId: appointmentId, rating: rating, description: description)
            return true
        }
    }
    
    func makeReview(appointmentId: Int, rating: Int, description: String) {
                let url = URL(string: "http://cashit.link/api/giveReview")!
                let body: [String: Any] = ["appointmentId": appointmentId, "rating": rating, "description": description]
                let finalBody = try! JSONSerialization.data(withJSONObject: body)
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = finalBody
                URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data
                    else {
                        print(error?.localizedDescription ?? "No data")
                        return
                    }
                }.resume()
                
    }
}
