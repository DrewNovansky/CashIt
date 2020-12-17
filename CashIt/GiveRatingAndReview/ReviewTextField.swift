//
//  ReviewTextField.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct ReviewTextField: View {
    @Binding var review: String
    
    var body: some View {
        TextField("Your Review", text: $review)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: UIScreen.main.bounds.width*0.8)
            .multilineTextAlignment(TextAlignment.center)
    }
}

struct ReviewTextField_Previews: PreviewProvider {
    static var previews: some View {
        ReviewTextField(review: .constant("Review"))
    }
}
