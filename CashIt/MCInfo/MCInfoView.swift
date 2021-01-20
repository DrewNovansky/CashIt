//
//  MCInfoView.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import SwiftUI

struct MCInfoView: View {
    
    var viewModel = InfoViewModel()
    
    var body: some View {
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(24)
            VStack{
            HStack{
                HStack{
                    Text("Nama")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 3)
                .font(Font.title3.weight(.bold))
                
                HStack{
                    Text(viewModel.moneyChanger.moneyChangerName)
                    Spacer()
                }.font(.system(size: 19))
            }.padding(10)
            
            HStack{
                HStack{
                    Text("Jarak")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 3)
                .font(Font.title3.weight(.bold))
                
                HStack{
                    Text("500 m")
                    Spacer()
                }.font(.system(size: 19))
            }.padding(10)
            
            HStack{
                HStack{
                    // open WA
                    Text("Nomor Telepon")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 3)
                .font(Font.title3.weight(.bold))
                
                HStack{
                    Text(viewModel.moneyChanger.phoneNumber)
                    Spacer()
                }.font(.system(size: 19))
            }.padding(10)
            
            HStack{
                HStack{
                    Text("Lokasi")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 3)
                .font(Font.title3.weight(.bold))
                
                HStack{
                    Text(viewModel.moneyChanger.address)
                    Spacer()
                }.font(.system(size: 19))
            }.padding(10)
            
            HStack{
                HStack{
                    Text("Jam Operasional")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 3)
                .font(Font.title3.weight(.bold))
                
                VStack{
                    ForEach(viewModel.operationalHours) { operationalHours in
                        InfoCellView(operationalHour: operationalHours)
                    }
                }
            }.padding(10)
            
            
            }.frame(width: UIScreen.main.bounds.width-20)
            .foregroundColor(.black)
            .background(Color("CardBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            Spacer()
        }.navigationBarTitle(Text("Informasi"), displayMode: .inline)
        .padding(10)
    }
}

struct MCInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MCInfoView()
    }
}
