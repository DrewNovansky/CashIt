//
//  SubmitLogin.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 30/12/20.
//

import SwiftUI
import MapKit

struct SubmitLogin: View {
    @ObservedObject var viewModel = LoginViewModel()
    @Binding var showView: Bool
    @Binding var showAlert: Bool
    var action: (() -> Bool)? = nil
    var body: some View {
        NavigationLink(destination: viewModel.segueToMainView(showView: $showView), isActive: $showView){
            Button(action: {
                if let run = action {
                    if run() {
                        self.showView = true
                    }
                    else {
                        self.showAlert = true
                    }
                }
            }, label: {Text("Masuk")
                .font(.body)
                .foregroundColor(.white)
                .frame(
                    width: UIScreen.main.bounds.width-20,
                    height:UIScreen.main.bounds.height*0.05,
                    alignment: .center)
                .background(Color("AccentColor"))
                .padding(.bottom)})
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Error!"), message: Text("Please fill all the information to Sign In"), dismissButton: .cancel(Text("Okay")))
        }
    }
}

struct SubmitLogin_Previews: PreviewProvider {
    static var previews: some View {
        SubmitLogin(showView: .constant(false), showAlert: .constant(false))
    }
}
