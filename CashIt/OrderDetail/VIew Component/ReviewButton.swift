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
                .fontWeight(.semibold)
                .frame(width: UIScreen.main.bounds.width-20, height: 45)
                .foregroundColor(.white)
                .background(Color("AccentColor"))
                .cornerRadius(25)
        })
        .sheet(isPresented: $isPresentingModalView, content: {
            GiveRatingAndReviewView()
        })
            
            .font(.title2)
            .padding(.bottom)
    }
}

struct ReviewButton_Previews: PreviewProvider {
    static var previews: some View {
        ReviewButton(isPresentingModalView: .constant(false))
    }
}
