//
//  CurrencySelect.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 01/01/21.
//

import SwiftUI

struct CurrencySelect: View {
    @Binding var fromTo: Bool
    var body: some View {
        HStack{
            VStack{
                
                HStack{
                    if fromTo{
                    DropDown()
                    }
                    else{
                        HStack{
                                VStack{
                                    HStack{
                                        Text("IDR").fontWeight(.semibold)
                                    }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height*0.05, alignment: .center)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke( Color.gray, lineWidth: 3)
                                    )
                                }
                                .offset(y: UIScreen.main.bounds.height*0.012)
                        }
                        .zIndex(4)
                    }
                }.zIndex(5)
                ZStack{
                    HStack{
                        Spacer()
                    Button(action: {
                        fromTo.toggle()
                    }, label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 30.0)
                    })
                    }
                Divider()
                }
                if fromTo{
                HStack{
                        VStack{
                            HStack{
                                Text("IDR").fontWeight(.semibold)
                            }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height*0.05, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke( Color.gray, lineWidth: 3)
                            )
                        }
                }.zIndex(4)
                .offset(y: -UIScreen.main.bounds.height*0.012)
                }
                else{
                    DropDown()
                        .offset(y: -UIScreen.main.bounds.height*0.025)
                }
            }.frame(height: UIScreen.main.bounds.height*0.15)
            .border(Color.black, width: 1)
            .zIndex(6)
        }.zIndex(5)
    }
}

struct CurrencySelect_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelect(fromTo: .constant(false))
    }
}
