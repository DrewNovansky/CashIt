//
//  MCMakeAppointmentView.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import SwiftUI

struct mc : Identifiable,Decodable,Hashable {
    var id: Int
    let itemName: String
    let itemPriceJual: String
    let itemPriceBeli: String
}

var mcs = [
    mc(id: 0, itemName: "USD", itemPriceJual: "Rp. 14.165,00", itemPriceBeli: "Rp. 14.195,00"),
    mc(id: 1, itemName: "SGD", itemPriceJual: "Rp. 10.601,88", itemPriceBeli: "Rp. 10.632,03"),
    mc(id: 2, itemName: "THB", itemPriceJual: "Rp. 467,20", itemPriceBeli: "Rp. 475,56"),
    mc(id: 3, itemName: "JPY", itemPriceJual: "Rp. 135,49", itemPriceBeli: "Rp. 138,47"),
    mc(id: 4, itemName: "KRW", itemPriceJual: "Rp. 14.150,00", itemPriceBeli: "Rp. 14.180,00")
]

let sortedMcs = mcs.sorted {$0.id < $1.id}

struct MCMakeAppointmentView: View {
    
    var name : String = "Maju Jaya Money Changer"
    @State var appoinmentFrom : String = ""
    @State var appoinmentFromPrice : String = ""
    @State var appoinmentTo : String = ""
    @State var appoinmentToPrice : String = ""
    @State var appoinmentDate = Date()
    @State var appoinmentTime = Date()
    
    var body: some View {
        
        VStack{
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 100, height: 100, alignment: .center)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.top, 24)
                .padding(.bottom, 32)
            
            Text(name)
                .padding(.bottom, 15)
                .font(.system(size:25))
            
            
            HStack{
                Picker("From", selection: $appoinmentFrom){
                    ForEach(sortedMcs) { item in
                        Text(item.itemName)
                    }
                }.frame(maxWidth: UIScreen.main.bounds.width/2)
                
                TextField("Rp.", text: $appoinmentFromPrice)
                    .frame(maxWidth: UIScreen.main.bounds.width/2)
            }.padding()
            
            HStack{
                Picker("To", selection: $appoinmentFrom){
                    ForEach(sortedMcs) { item in
                        Text(item.itemName)
                    }
                }.frame(maxWidth: UIScreen.main.bounds.width/2)
                
                TextField("Rp.", text: $appoinmentFromPrice)
                    .frame(maxWidth: UIScreen.main.bounds.width/2)
            }.padding()
            
            HStack {
                Text("Date")
                    .frame(maxWidth: UIScreen.main.bounds.width/2)
                
                DatePicker("", selection: $appoinmentDate, displayedComponents: .date)
                    .frame(maxWidth: UIScreen.main.bounds.width/2)
                
            }.padding()
            
            HStack {
                Text("Time")
                    .frame(maxWidth: UIScreen.main.bounds.width/2)
                
                DatePicker("", selection: $appoinmentTime, displayedComponents: .hourAndMinute)
                    .frame(maxWidth: UIScreen.main.bounds.width/2)
                
            }.padding()
            
            
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
