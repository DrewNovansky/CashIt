//
//  HomeViewModel.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation
import SwiftUI
import MapKit
class HomeViewModel: ObservableObject {
    var store: [MoneyChanger] = []
    var currency: [Currency] = []
    var distance: Double = 0
    var locValue: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0,longitude: 0)
    let locationManager = CLLocationManager()
    // Dummy Data
    init() {
        locValue = locationManager.location?.coordinate ?? CLLocationCoordinate2D()
        self.store.append(contentsOf: [
            MoneyChanger(moneyChangerName: "Andrew MC",photo: "Test", address: "Kp Janis",whatsappLink: "", phoneNumber: "",latitudeCoordinate:-6.175498079151794,longitudeCoordinate: 106.82726958474876,distance: 20),
            MoneyChanger(moneyChangerName: "Evan MC",photo: "Test", address: "Palmerah",whatsappLink: "", phoneNumber: "",latitudeCoordinate:-6.175498079151794,longitudeCoordinate: 106.82726958474876,distance: 20),
            MoneyChanger(moneyChangerName: "Sherwin MC", photo: "Test", address: "Riau",whatsappLink: "", phoneNumber: "",latitudeCoordinate:-6.1375,longitudeCoordinate: 106.8046,distance: 20),
            MoneyChanger(moneyChangerName: "Dana MC",photo: "Test", address: "Puncak Monas",whatsappLink: "", phoneNumber: "",latitudeCoordinate:-7.1375,longitudeCoordinate: 109.8046,distance: 20),
            MoneyChanger(moneyChangerName: "Maju Roso MC", photo: "Test", address: "Emasnya Monas",whatsappLink: "", phoneNumber: "",latitudeCoordinate:-7.1375,longitudeCoordinate: 107.8046,distance: 20)
                ])
        for i in 0..<(store.count)
        {
            let loc1 = CLLocation(latitude: locationManager.location?.coordinate.latitude ?? locValue.latitude,longitude: locationManager.location?.coordinate.longitude ?? locValue.longitude)
            let loc2 = CLLocation(latitude: store[i].latitudeCoordinate, longitude: store[i].longitudeCoordinate)
            distance = loc1.distance(from: loc2)
            store[i].distance = distance
        }
        store.sort {
            $0.distance < $1.distance
//            Price Sort implement price Currency first
//                && $0.storePrice < $1.storePrice
        }
    }
    
    func getStore(index: Int) -> MoneyChanger {
        return store[index]
    }
    
    func segue(showView: Binding<Bool>) -> MCProfileView {
        let viewModel = MCProfileViewModel()
        viewModel.distance = self.distance//terima parameter
        let view = MCProfileView(rootIsActive: showView)
        return view
    }
}
