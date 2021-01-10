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
                Spacer()
                DatePicker("", selection: $viewModel.appoinmentDate, displayedComponents: [.date])
            }
            HStack {
                Text("Waktu")
                Spacer()
                DatePicker("", selection: $viewModel.appoinmentTime, displayedComponents: [.hourAndMinute])
            }
        }.font(.title2)
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentDateAndTime()
    }
}
