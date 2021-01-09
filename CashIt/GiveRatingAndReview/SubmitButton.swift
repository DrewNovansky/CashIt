//
//  SubmitButton.swift
//  CashIt
//
//  Created by Sherwin Yang on 07/12/20.
//

import SwiftUI

struct SubmitButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var action: (() -> Bool)?
    
    var body: some View {
        Button(
            action: {
                if let run = action {
                    if run() {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    else {
                        print("no")
                    }
                }
            },
            label: {
                Text("Simpan")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("AccentColor"))
            })
            .padding()
            .frame(width: UIScreen.main.bounds.width*0.8, height: 50)
            .overlay(
                Capsule(style: .continuous)
                    .stroke(Color("AccentColor"), lineWidth: 5)
            )
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton()
    }
}
