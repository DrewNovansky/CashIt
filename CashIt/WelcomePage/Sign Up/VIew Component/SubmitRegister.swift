//
//  SubmitRegister.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 30/12/20.
//

import SwiftUI
import MapKit

struct SubmitRegister: View {
    @ObservedObject var viewModel = RegisterViewModel()
    @Binding var showView:Bool
    @Binding var showAlert:Bool
    var action: (() -> Bool)?
    var body: some View {
        NavigationLink(destination: viewModel.segueToLogin(), isActive: $showView){
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
                    width: UIScreen.main.bounds.width-20,
                    height:UIScreen.main.bounds.height*0.05,
                    alignment: .center)
                .background(Color("AccentColor"))
                .padding(.bottom)})
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Pesan Error"), message: Text("Mohon isi semua data yang diperlukan untuk melakukan pendaftaran"), dismissButton: .cancel(Text("Tutup")))
        }
    }
}

struct SubmitRegister_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hi!")
        
    }
}
