//
//  HomeMapViewModel.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 05/01/21.
//

import Foundation
import MapKit
import SwiftUI

class HomeMapViewModel: ObservableObject{
    var store: [MoneyChanger] = []
    var annotatedMoneyChanger: [MKPointAnnotation] = [MKPointAnnotation]()
    let locationManager = CLLocationManager()
    init() {
       
        self.store.append(contentsOf: [
            MoneyChanger(moneyChangerName: "Andrew MC",photo: "Test", address: "Kp Janis",whatsappLink: "", phoneNumber: "",latitudeCoordinate:-6.175498079151794,longitudeCoordinate: 106.82726958474876,distance: 20),
            MoneyChanger(moneyChangerName: "Evan MC",photo: "Test", address: "Palmerah",whatsappLink: "", phoneNumber: "",latitudeCoordinate:-6.175498079151794,longitudeCoordinate: 106.82726958474876,distance: 20)
        ])
        
        for i in 0..<(store.count)
        {
            let pointAnnotation = MKPointAnnotation() // First create an annotation.
            pointAnnotation.title = store[i].moneyChangerName
            pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: store[i].latitudeCoordinate, longitude: store[i].longitudeCoordinate)
            pointAnnotation.subtitle = store[i].address
            annotatedMoneyChanger.append(pointAnnotation) // Now append this newly created annotation to array.
        }
    }
    
    func segue(showView: Binding<Bool>, distance: Double) -> MCProfileView {
        let viewModel = MCProfileViewModel()
        //terima parameter
        let view = MCProfileView(rootIsActive: showView)
        viewModel.distance = 100
        return view
    }
   
}
