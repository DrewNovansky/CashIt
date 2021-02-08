//
//  AppoinmentDropDownView.swift
//  CashIt
//
//  Created by Evan Renanto on 08/01/21.
//

import SwiftUI



struct AppointmentDropDownView: View {
    @ObservedObject var viewModel = MCMakeAppointmentViewModel()
    @State var expand = false
    @Binding var text: String
    @Binding var itemSelected: Int
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
                ForEach(0..<viewModel.currency.count){
                    item in
                    AppointmentDropDownElement(element: viewModel.currency[item].currencyName, expand: $expand, text: $text, onClick: { () in
                        itemSelected = item
                        print("\(itemSelected)\n\n\n\n\n\n\n\n\n\n")
                    })
                        .offset(y: UIScreen.main.bounds.height * (0.055 * CGFloat(item + 1)))
                }
            }
        }
    }
}
struct AppointmentDropDownView2: View {
    @ObservedObject var viewModel = MCMakeAppointmentViewModel()
    @State var expand = false
    @Binding var text: String
    @Binding var itemSelected: Int
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
                ForEach(0..<viewModel.currency.count){
                    item in
                    AppointmentDropDownElement(element: viewModel.currency[item].currencyName, expand: $expand, text: $text, onClick: { () in
                        itemSelected = item
                        print("\(itemSelected)\n\n\n\n\n\n\n\n\n\n")
                    })
                        .offset(y: UIScreen.main.bounds.height * (0.055 * CGFloat(item + 1)))
                }
            }
        }
    }
}

struct AppointmentDropDownElement:View {
    var element = "test"
    @Binding var expand:Bool
    @Binding var text:String
    var onClick: () -> Void
    var body : some View{
        Button(action: {
            text = "\(element)"
            onClick()
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

//struct AppoinmentDropDownView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppointmentDropDownView(text: .constant(""), itemSelected: .constant(0))
//    }
//}
