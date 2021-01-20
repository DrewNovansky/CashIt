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
                let mean = viewModel.getStoreRating()
                Text("\(mean)")
                    .font(.system(size: 50))
                VStack{
                    HStack{
                        
                        ForEach(0..<mean){ i in
                            Image(systemName: "star.fill").resizable().frame(width: 30, height: 30, alignment: .center).foregroundColor(.yellow)
                        }
                    }
                    Text("\(viewModel.reviews.count)" + " Ulasan")
                }.frame(alignment: .leading)
            }.padding(10)
            if(viewModel.reviews.count < 1){
                Text("Money Changer ini belum memiliki Ulasan")
            }else {
                ScrollView(){
                    ForEach(viewModel.reviews) { review in
                        ReviewCellView(review: review)
                    }
                }
            }
        }.navigationBarTitle(Text("Ulasan"), displayMode: .inline)
    }
}

struct MCReviewView_Previews: PreviewProvider {
    static var previews: some View {
        MCReviewView()
    }
}
