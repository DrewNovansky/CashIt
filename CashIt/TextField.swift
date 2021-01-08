//
//  TextField.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 30/12/20.
//

import SwiftUI

//Mark: This was used to make textfield with style like in login and register
struct TextFieldTemp: View {
    @Binding var input: String
    var textField: String
    var body: some View {
        Text("\(textField)")
            .font(.body)
        TextField("Masukan \(textField)", text: $input)
            .autocapitalization(.none)
            .padding(.bottom)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        Text("Textfield")
    }
}
