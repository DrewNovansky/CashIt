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
        VStack{
        multilineTF(placeholder: "Ulasan Anda", textWritten: $review)
            .multilineTextAlignment(TextAlignment.center)
            .foregroundColor(.white)
        }
    }
}

struct ReviewTextField_Previews: PreviewProvider {
    static var previews: some View {
        ReviewTextField(review: .constant("Review"))
    }
}
