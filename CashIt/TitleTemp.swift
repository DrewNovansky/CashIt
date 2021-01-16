//
//  titleTemp.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 30/12/20.
//

import SwiftUI

//MARK : this was used to make the title made in preview
struct TitleTemp: View {
    var text: String
    var body: some View {
        Text("\(text)")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.vertical)
            .foregroundColor(Color("AccentColor"))
    }
}

struct titleTemp_Previews: PreviewProvider {
    static var previews: some View {
        TitleTemp(text: "String")
    }
}
