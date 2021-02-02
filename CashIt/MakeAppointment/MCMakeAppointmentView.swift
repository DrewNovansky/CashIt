//
//  MCMakeAppointmentView.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import SwiftUI

struct MCMakeAppointmentView: View {
    
    @ObservedObject var viewModel = MCMakeAppointmentViewModel()
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    @Binding var popToRootView : Bool
    @State var showAlert = false
    var body: some View {
        ZStack{
            VStack{
                Image(UserDefaults.standard.string(forKey: "photo") ?? "")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100, alignment: .center)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                Text(viewModel.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 15)
                Spacer()
                VStack{
                    AppointmentSetCurrency()
                }.zIndex(15)
                .padding()
                Spacer()
                VStack{
                    AppointmentDateAndTime()
                        .padding()
                    Text("\(viewModel.appoinmentDate)")
                }.zIndex(14)
                Spacer()
                Text("Sebelumnya kami tidak menjamin harga yang berubah.\nKarena fluktuatifnya harga valuta yang dipilih")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                    self.showAlert = true
                }, label: {
                    Text("Buat Pesanan")
                        .font(.title2)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 45)
                        .foregroundColor(.white)
                        .background(Color("AccentColor"))
                        .cornerRadius(25)
                        .padding()
                })
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Success!"), message: Text("Pesanan berhasil dibuat. Dengan kode pesanan : 7-1-2021-1"), dismissButton: .default(Text("Okay"), action: {
                        self.popToRootView = false
                    }))
                }
            }.onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

struct MCMakeAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        MCMakeAppointmentView(popToRootView: .constant(false))
    }
}

enum Validation {
    case success
    case failure(message: String)
    var isSuccess: Bool {
        if case .success = self {
            return true
        }
        return false
    }
}
