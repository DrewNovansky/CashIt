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
                    .fontWeight(.semibold)
            })
            .frame(width: UIScreen.main.bounds.width-20, height: 45)
            .foregroundColor(.white)
            .background(Color("AccentColor"))
            .cornerRadius(25)
            .font(.title2)
            .padding(.bottom)
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton()
    }
}
