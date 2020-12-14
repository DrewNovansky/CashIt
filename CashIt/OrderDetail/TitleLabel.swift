//
//  TitleLabel.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct TitleLabel: View {
    var title: String = ""
    
    var body: some View {
        Text("\(title)")
            .font(.headline)
            .foregroundColor(Color.gray)
    }
}

struct TitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        TitleLabel()
    }
}
