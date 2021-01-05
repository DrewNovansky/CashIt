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
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.top, 24)
                .padding(.bottom, 32)
            
            HStack{
                HStack{
                    Text("Name")
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
                    Text("Distance")
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
                    Text("Contact")
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
                    Text("Location")
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
                    Text("Opening Hours")
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
            
        }.navigationBarTitle(Text("Information"), displayMode: .inline)
        .padding(10)
    }
}

struct MCInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MCInfoView()
    }
}
