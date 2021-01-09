//
//  ReviewCellView.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import SwiftUI

struct ReviewCellView: View {
    
    var review: Reviews

    var body: some View {
        
        VStack{
            HStack{
                Text(review.userName)
                    .frame(maxWidth: UIScreen.main.bounds.width/2, alignment: .leading)
                    .font(.system(size: 19,weight: .semibold))
                Spacer()
                Text(review.date)
                    .frame(maxWidth: UIScreen.main.bounds.width/2, alignment: .trailing)
            }.padding()
            
            HStack{
                Text(review.description)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: UIScreen.main.bounds.width/2, maxHeight: UIScreen.main.bounds.height/5,alignment: .leading)
                Spacer()
                HStack{
                    ForEach(0..<review.rating){ i in
                        Image(systemName: "star.fill").resizable().frame(width: 25, height: 25, alignment: .trailing).foregroundColor(.yellow)
                    }
                }
            }.padding()
            
        }.frame(width: UIScreen.main.bounds.width*0.85, height: 107)
        .background(Color(red: 245/256, green: 245/256, blue: 245/256))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

struct ReviewCellView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCellView(review: Reviews(rating: 5, userName: "Bambang Sutarjo", date: "12/12/2012", description: "Amazingly Good AF Holy Moly"))
    }
}
