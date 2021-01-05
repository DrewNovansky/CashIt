//
//  DropDown.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 01/01/21.
//

import SwiftUI

var currencies = ["IDR","USD","KRW","RGM"]

struct DropDown:View {
    @State var expand = false
    @State var text = currencies[1]
    var body: some View{
        ZStack{
            VStack{
                HStack{
                    Text("\(text)").fontWeight(.semibold)
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 10, height: 5)
                    
                }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height*0.05, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(expand ? Color("AccentColor") : Color.gray, lineWidth: 3)
                )
                .onTapGesture(perform: {
                    self.expand.toggle()
                })
            }.offset(y: UIScreen.main.bounds.height*0.01)
            .animation(.spring())
            if expand{
                ForEach(0..<currencies.count){
                    currency in
                    DropDownElement(element: currencies[currency], expand: $expand, text: $text)
                        .offset(y: UIScreen.main.bounds.height * (0.055 * CGFloat((currency + 1))))
                }
            }
        }
    }
}


struct DropDownElement:View {
    var element = "test"
    @Binding var expand:Bool
    @Binding var text:String
    var body : some View{
        Button(action: {
            text = "\(element)"
            expand.toggle()
        }, label: {
            Text("\(element)")
                .padding()
                
        })
        .foregroundColor(Color(.black))
        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height*0.05, alignment: .center)
        .background(Color(.white))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(expand ? Color("AccentColor") : Color.gray, lineWidth: 3)
        )
        .offset(y: UIScreen.main.bounds.height*0.01)
    }
}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        DropDown()
    }
}
