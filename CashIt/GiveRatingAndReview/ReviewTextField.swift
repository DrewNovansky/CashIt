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
        multilineTF(placeholder: "Ulasan Anda", textWritten: $review)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.2)
            .multilineTextAlignment(TextAlignment.center)
            .foregroundColor(.white)
    }
}

struct ReviewTextField_Previews: PreviewProvider {
    static var previews: some View {
        ReviewTextField(review: .constant("Review"))
    }
}
