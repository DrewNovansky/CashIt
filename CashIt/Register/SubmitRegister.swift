//
//  SubmitRegister.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 30/12/20.
//

import SwiftUI
import MapKit

struct SubmitRegister: View {
    @Binding var showView:Bool
    @Binding var showAlert:Bool
    var action: (() -> Bool)?
    var body: some View {
        NavigationLink(destination: TabBarVIew(), isActive: $showView){
            Button(action: {
                if let run = action {
                    if run() {
                        self.showView = true
                    }
                    else {
                        self.showAlert = true
                    }
                }
            }, label: {Text("Daftar")
                .font(.body)
                .foregroundColor(.white)
                .frame(
                    width: UIScreen.main.bounds.width*0.9,
                    height:UIScreen.main.bounds.height*0.05,
                    alignment: .center)
                .background(Color("AccentColor"))
                .padding(.bottom)})
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Error!"), message: Text("We're sorry but you need to fill all the box to register"), dismissButton: .cancel(Text("Okay")))
        }
    }
}

struct SubmitRegister_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hi!")
        
    }
}
