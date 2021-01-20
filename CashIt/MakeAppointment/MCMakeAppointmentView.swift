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
    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 100, height: 100, alignment: .center)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                Text(viewModel.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 15)
                Spacer()
                VStack{
                    AppointmentSetCurrency(switcher: .constant(false), textFieldFrom: $viewModel.appoinmentFromPrice, textFieldTo: $viewModel.appoinmentToPrice)
                }.zIndex(15)
                .padding()
                Spacer()
                VStack{
                    AppointmentDateAndTime()
                        .padding()
                }.zIndex(14)
                Spacer()
                Spacer()
                Spacer()
                Button("Confirm"){
                    self.popToRootView = false
                }
                .font(.title2)
                .frame(width: UIScreen.main.bounds.width - 20, height: 45)
                .foregroundColor(.white)
                .background(Color("AccentColor"))
                .cornerRadius(25)
                .padding()
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
