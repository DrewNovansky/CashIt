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
    
    var body: some View {
        
        VStack{
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 100, height: 100, alignment: .center)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.top, 24)
                .padding(.bottom, 32)
            
            Text(viewModel.name)
                .padding(.bottom, 15)
                .font(.system(size:25))
            
            
            Form{
                
                Section(header: Text("Jumlah")){
                    AppointmentSetCurrency(switcher: .constant(false), textFieldFrom: $viewModel.appoinmentFromPrice, textFieldTo: $viewModel.appoinmentToPrice)
                }
                
                Section(header: Text("Waktu dan Tanggal")){
                    
                    HStack {
                        Text("Tanggal")
                        
                        Spacer()
                        
                        DatePicker("", selection: $viewModel.appoinmentDate, displayedComponents: [.date])
                        
                    }.padding()
                    
                    HStack {
                        Text("Waktu")
                        
                        Spacer()
                        
                        DatePicker("", selection: $viewModel.appoinmentTime, displayedComponents: [.hourAndMinute])
                        
                    }.padding()
                }
                
                
            }
            
            HStack{
                Button("Confirm"){
                    
                }
                .padding()
                .font(.title2)
                .frame(width: UIScreen.main.bounds.width - 20, height: 45)
                .foregroundColor(.white)
                .background(Color.purple)
                .cornerRadius(25)
            }
        }
        
    }
}

struct MCMakeAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        MCMakeAppointmentView()
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
