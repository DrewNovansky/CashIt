//
//  ReviewButton.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct ReviewButton: View {
    @Binding var isPresentingModalView: Bool
    
    var body: some View {
        Button(
            action: {
                self.isPresentingModalView.toggle()
            },
            label: {
            Text("Beri Ulasan")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color("AccentColor"))
        })
        .sheet(isPresented: $isPresentingModalView, content: {
            GiveRatingAndReviewView()
        })
        .frame(width: UIScreen.main.bounds.width*0.8, height: 50)
        .overlay(
            Capsule(style: .continuous)
                .stroke(Color("AccentColor"), lineWidth: 5)
        )
    }
}

struct ReviewButton_Previews: PreviewProvider {
    static var previews: some View {
        ReviewButton(isPresentingModalView: .constant(false))
    }
}
