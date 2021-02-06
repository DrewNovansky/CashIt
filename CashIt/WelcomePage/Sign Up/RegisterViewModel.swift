//
//  RegisterViewModel.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var user = User()
    
    func checkIfAllFieldsFilled() -> Bool {
        if self.user.username.isEmpty || self.user.email.isEmpty || self.user.password.isEmpty || self.user.confPassword.isEmpty || self.user.password != self.user.confPassword{
            print("\(user.username) and \(user.password)")
            return false
        }
        createLoginData(email: user.email, username: user.username, password: user.password)
    
        print("\(user.username) and \(user.password)")
        return true
    }
    func segueToLogin() -> LoginView {
        let view = LoginView()
        return view
    }
    func createLoginData(email: String, username: String, password: String){
        let url = URL(string: "http://cashit.link/api/customerRegister")!
        let body: [String: String] = ["email" : email, "name" : username, "password": password]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = finalBody
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print("\(responseJSON) ini responseJSON\n\n\n\n\n\n\n")
            }
        }
        task.resume()
    }
}
