//
//  MCReviewView.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import SwiftUI

struct MCReviewView: View {
    
    var viewModel = ReviewViewModel()
    
    var body: some View {
        
        VStack{
            HStack{
                
                Text("\(viewModel.getStoreRating())")
                    .font(.system(size: 50))
                
                VStack{
                    HStack{
                        ForEach(0..<viewModel.getStoreRating()){ i in
                            Image(systemName: "star.fill").resizable().frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.yellow)
                        }
                    }
                    
                    Text("\(viewModel.reviews.count)" + " Review(s)")
                    
                }.frame(alignment: .leading)
            }
            
            Spacer()
            
            if(viewModel.reviews.count < 1){
                Text("There isn't any review for this Money Changer")
            }else {
                ScrollView(){
                    ForEach(viewModel.reviews) { review in
                        ReviewCellView(review: review)
                    }
                }
            }
        }.navigationBarTitle(Text("Reviews"), displayMode: .inline)
    }
}

struct MCReviewView_Previews: PreviewProvider {
    static var previews: some View {
        MCReviewView()
    }
}
