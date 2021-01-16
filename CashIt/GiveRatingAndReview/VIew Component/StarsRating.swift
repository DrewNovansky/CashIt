//
//  StarsRating.swift
//  CashIt
//
//  Created by Sherwin Yang on 07/12/20.
//

import SwiftUI

struct StarsRating: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1) { number in
                self.starImage(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
    }
    
    func starImage(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        }
        else {
            return onImage
        }
    }
}

struct StarsRating_Previews: PreviewProvider {
    static var previews: some View {
        StarsRating(rating: .constant(5))
    }
}
