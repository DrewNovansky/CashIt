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
    var store: [Store] = []
    var annotatedMoneyChanger: [MKPointAnnotation] = [MKPointAnnotation]()
    var annotations: [Annotations] = []
    let locationManager = CLLocationManager()
    init() {
       
        self.annotations.append(contentsOf: [
            Annotations(storeName: "Monas", storeLatitude: -6.175498079151794, storeLongitude: 106.82726958474876, storeAddress: "Tugu Monas"),
            Annotations(storeName: "Andrew MC", storeLatitude: -6.1375, storeLongitude: 106.8046, storeAddress: "Pekojan")
        ])
        
        for i in 0..<(annotations.count)
        {
            let pointAnnotation = MKPointAnnotation() // First create an annotation.
            pointAnnotation.title = annotations[i].storeName
            pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: annotations[i].storeLatitude, longitude: annotations[i].storeLongitude)
            pointAnnotation.subtitle = annotations[i].storeAddress
            annotatedMoneyChanger.append(pointAnnotation) // Now append this newly created annotation to array.
        }
    }
    
    func segue(showView: Binding<Bool>) -> MCProfileView {
        let viewModel = MCProfileViewModel()//terima parameter
        let view = MCProfileView(rootIsActive: showView)
        return view
    }
   
}
