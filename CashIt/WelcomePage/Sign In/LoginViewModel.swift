//
//  LoginViewModel.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation
import SwiftUI
import Combine

struct serverMessage: Codable{
    struct User: Codable{
        let id: Int
        let username: String
        let email: String
        private enum CodingKeys : String, CodingKey {
                      case id = "id"
                      case username = "userName"
                      case email = "email"
                   }
    }
    let user: User
}

class LoginViewModel: ObservableObject {
    @Published var user = User()
    func checkIfAllFieldsFilled() -> Bool {
        if self.user.email.isEmpty || self.user.password.isEmpty {
            return false
        }
        checkLogin(email: user.email, password: user.password)
        return true
    }
    func segueToMainView(showView: Binding<Bool>) -> TabBarView {
        let view = TabBarView(rootIsActive: showView)
        return view
    }
    
    func checkLogin(email: String, password: String){
        let url = URL(string: "http://cashit.link/api/customerLogin")!
        let body: [String: String] = ["email" : email, "password" : password]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = finalBody
        URLSession.shared.dataTask(with: request) { data, response, error in
            // handle the result here.
            guard let data = data
            else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            let finalData = try? JSONDecoder().decode(serverMessage.self, from: data)
            print("\(body)")
            print("\(finalBody)")
            print("\(finalData) ini final data \n\n\n\n\n\n ")
            DispatchQueue.main.async {
                self.user.email = finalData?.user.email ?? ""
                self.user.username = finalData?.user.username ?? ""
                UserDefaults.standard.set(finalData?.user.username ?? "", forKey: "username")
            }
        }.resume()
//        guard let url = URL(string: "http://cashit.link/api/customerLogin") else {
//            print("Error URl")
//            return
//        }
//
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) {data, response, error in
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode(User.self, from: data){
//                    DispatchQueue.main.async {
//
//
//                    }
//                }
//            }
//        }.resume()
    
//                guard let encoded = try? JSONEncoder().encode(user) else {
//                    print("Failed to encode user")
//                    return
//                }
    }
}
