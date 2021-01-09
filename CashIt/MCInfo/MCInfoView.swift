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
                .foregroundColor(.gray)
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.top, 24)
                .padding(.bottom, 32)
            
            HStack{
                HStack{
                    Text("Nama")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 3)
                .font(Font.title3.weight(.bold))
                
                HStack{
                    Text(viewModel.name)
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
                    Text("Nomor Telepon")
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width / 3)
                .font(Font.title3.weight(.bold))
                
                HStack{
                    Text(viewModel.wa)
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
                    Text(viewModel.address)
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
