//
//  DatePicker.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 09/01/21.
//

import SwiftUI

struct AppointmentDateAndTime: View {
    @ObservedObject var viewModel = MCMakeAppointmentViewModel()
    var body: some View {
        VStack{
            HStack {
                Text("Tanggal")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                DatePicker("", selection: $viewModel.appoinmentDate, displayedComponents: [.date])
            }.padding(.horizontal,5)
            HStack {
                Text("Waktu")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                DatePicker("", selection: $viewModel.appoinmentTime, displayedComponents: [.hourAndMinute])
            }.padding(.horizontal,5)
        }
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentDateAndTime()
    }
}
