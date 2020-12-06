//
//  ContentLabel.swift
//  CashIt
//
//  Created by Sherwin Yang on 06/12/20.
//

import SwiftUI

struct ContentLabel: View {
    var content: String = ""
    
    var body: some View {
        Text("\(content)")
            .font(.title)
    }
}

struct ContentLabel_Previews: PreviewProvider {
    static var previews: some View {
        ContentLabel()
    }
}
