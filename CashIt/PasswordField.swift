//
//  SecuredTextField.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 30/12/20.
//

import SwiftUI

struct PasswordFieldTemp: View {
    @Binding var input: String
    var textField: String
    var body: some View {
        Text("\(textField)")
            .font(.body)
        SecureField("Insert \(textField)", text: $input)
            .autocapitalization(.none)
            .textContentType(.newPassword)
            .padding(.bottom)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
struct SecuredTextField_Previews: PreviewProvider {
    static var previews: some View {
       Text("Hi!")
    }
}
