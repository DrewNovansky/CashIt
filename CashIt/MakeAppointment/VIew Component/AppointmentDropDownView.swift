//
//  AppoinmentDropDownView.swift
//  CashIt
//
//  Created by Evan Renanto on 08/01/21.
//

import SwiftUI

var currency = ["IDR","USD","KRW","RGM"]

struct AppointmentDropDownView: View {
    
    @State var expand = false
    @State var text = currency[1]
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("\(text)").font(.title3)
                        .fontWeight(.semibold)
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 10, height: 5)
                    
                }.frame(width: UIScreen.main.bounds.width * 0.24, height: UIScreen.main.bounds.height*0.045, alignment: .center)
                .background(Color("CardBackground"))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke( Color.black, lineWidth: 3)
                )
                .onTapGesture(perform: {
                    self.expand.toggle()
                })
            }
            .animation(.spring())
            if expand{
                ForEach(0..<currency.count){
                    currency in
                    AppointmentDropDownElement(element: currencies[currency], expand: $expand, text: $text)
                        .offset(y: UIScreen.main.bounds.height * (0.055 * CGFloat((currency + 1))))
                    
                }
            }
        }
    }
}

struct AppointmentDropDownElement:View {
    var element = "test"
    @Binding var expand:Bool
    @Binding var text:String
    var body : some View{
        Button(action: {
            text = "\(element)"
            expand.toggle()
        }, label: {
            Text("\(element)")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(10)

        })
        .foregroundColor(Color(.black))
        .frame(width: UIScreen.main.bounds.width * 0.24, height: UIScreen.main.bounds.height*0.045, alignment: .center)
        .background(Color("CardBackground"))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 3)
        )
    }
}

struct AppoinmentDropDownView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentDropDownView()
    }
}
