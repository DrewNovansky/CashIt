//
//  RegisterButton.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 30/12/20.
//

import SwiftUI

struct RegisterButton: View {
    @Binding var showView: Bool
    var body: some View {
        HStack{
        Text("Belum punya akun?")
            NavigationLink(destination: RegisterView(), isActive: $showView){
                Button(action: {
                    showView.toggle()
                }, label: {Text("Daftar")
                    .font(.body)
                    .foregroundColor(Color("AccentColor"))
                    .underline()
                    })
            }
        }
        .frame(width: UIScreen.main.bounds.width*0.9, alignment: .center)
    }
}

struct RegisterButton_Previews: PreviewProvider {
    static var previews: some View {
        RegisterButton(showView: .constant(false))
    }
}
