//
//  ReviewCellView.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import SwiftUI

struct ReviewCellView: View {
    
    var review: Review
    @State var expand: Bool = true
    var body: some View {
        
        VStack{
            HStack{
                Text("*NAME*")
                    .fontWeight(.semibold)
                    .font(.headline)
                    .frame(maxWidth: UIScreen.main.bounds.width/2, alignment: .leading)
                    
                Spacer()
                Text(review.date)
                    .frame(maxWidth: UIScreen.main.bounds.width/2, alignment: .trailing)
            }.padding()
            
            HStack(alignment: .top){
                Text(review.description)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: UIScreen.main.bounds.width/2, maxHeight: expand ? UIScreen.main.bounds.height/3:UIScreen.main.bounds.height/4 ,alignment: .topLeading)
                Spacer()
                HStack{
                    ForEach(0..<review.rating){ i in
                        Image(systemName: "star.fill").resizable().frame(width: 25, height: 25, alignment: .trailing).foregroundColor(.yellow)
                    }
                }
            }.padding()
            
        }.frame(width: UIScreen.main.bounds.width - 20, height: expand ? UIScreen.main.bounds.height/7 :UIScreen.main.bounds.height/4)
        .background(Color("CardBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(10)
        .onTapGesture {
            expand.toggle()
        }
    }
}

struct ReviewCellView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCellView(review: Review(rating: 5, description: "Amazingly Good AF Holy Moly", date: "12/12/2012"))
    }
}
