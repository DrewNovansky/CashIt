//
//  SignInButton.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 30/12/20.
//

import SwiftUI

struct SignInButton: View{
    var buttonText:String = ""
    var backgroundColor:Color = Color("AccentColor")
    var foregroundColor:Color = Color(.white)
    
    var body: some View{
        Text("\(buttonText)")
            .font(.body)
            .foregroundColor(.white)
            .frame(
                width: UIScreen.main.bounds.width*0.9,
                height:UIScreen.main.bounds.height*0.05,
                alignment: .center)
            .background(Color("AccentColor"))
            .padding(.bottom)
    }
}
