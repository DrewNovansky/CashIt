//
//  LabelTemplate.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 24/11/20.
//

import SwiftUI
//MARK : this was used to make the title made in preview
struct titleTemp: View {
    var text: String
    var body: some View {
        Text("\(text)")
            .font(.title)
            .fontWeight(.semibold)
            .padding(.vertical)
            .foregroundColor(Color("AccentColor"))
    }
}
//Mark: This was used to make textfield with style like in login and register
struct textFieldTemp: View {
    @Binding var input: String
    var textField: String
    var body: some View {
        Text("\(textField)")
            .font(.caption)
        TextField("Insert \(textField)", text: $input)
            .padding(.bottom)
    }
}

struct LabelTemplate_Previews: PreviewProvider {
    static var previews: some View {
        titleTemp(text: "This is titleTemp")
    }
}
