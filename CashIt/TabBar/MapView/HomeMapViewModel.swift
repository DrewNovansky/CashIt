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
    var distance: Double = 0
    init() {
        load()
                print("\(store.count) ini count toko\n\n\n\n\n\n\n")
        for i in 0..<(store.count)
        {
            //untuk membuat titik annotate
            let pointAnnotation = MKPointAnnotation() // First create an annotation.
            pointAnnotation.title = store[i].moneyChangerName
            UserDefaults.standard.set(store[i].photo, forKey: "photo")
            pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: store[i].latitudeCoordinate, longitude: store[i].longitudeCoordinate)
            pointAnnotation.subtitle = "\(store[i].address) \n" + "\(countDistance(loc1Latitude: locationManager.location?.coordinate.latitude ?? store[i].latitudeCoordinate, loc1Longitude: locationManager.location?.coordinate.longitude ?? store[i].longitudeCoordinate, loc2Latitude: store[i].latitudeCoordinate, loc2Longitude: store[i].longitudeCoordinate)) KM"
            annotatedMoneyChanger.append(pointAnnotation) // Now append this newly created annotation to array.
        }
    }
    
    func countDistance(loc1Latitude: Double, loc1Longitude: Double,loc2Latitude: Double, loc2Longitude: Double) -> Double {
        let loc1 = CLLocation(latitude: loc1Latitude, longitude: loc1Longitude)
        let loc2 = CLLocation(latitude: loc2Latitude, longitude: loc2Longitude)
        distance = loc1.distance(from: loc2)
        distance = distance/1000
        distance = Double(round(100*distance)/100)
        return distance
    }
    func segue(showView: Binding<Bool>, distance: Double, index: Int) -> MCProfileView {
        let viewModel = MCProfileViewModel()
        var view = MCProfileView(viewModel:viewModel, rootIsActive: showView)
        viewModel.moneyChanger.moneyChangerId = self.store[index].moneyChangerId
        viewModel.moneyChanger.moneyChangerName = self.store[index].moneyChangerName
        viewModel.moneyChanger.address = self.store[index].address
        viewModel.moneyChanger.whatsappLink = self.store[index].whatsappLink
        viewModel.moneyChanger.phoneNumber = self.store[index].phoneNumber
        viewModel.distance = self.distance
        print(viewModel.moneyChanger.moneyChangerId)
        print(viewModel.moneyChanger.moneyChangerName)
        print(viewModel.moneyChanger.address)
        //terima parameter
        return view
    }
    
    func load() {
        let url = URL(string: "http://cashit.link/api/getAllMoneyChanger")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let decodedMC = try JSONDecoder().decode([MoneyChanger].self, from: data)
                    DispatchQueue.main.async {
                        self.store = decodedMC
                        for i in 0..<(self.store.count)
                        {
                            //untuk membuat titik annotate
                            let pointAnnotation = MKPointAnnotation() // First create an annotation.
                            pointAnnotation.title = self.store[i].moneyChangerName
                            UserDefaults.standard.set(self.store[i].photo, forKey: "photo")
                            pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: self.store[i].latitudeCoordinate, longitude: self.store[i].longitudeCoordinate)
                            pointAnnotation.subtitle = "\(self.store[i].address) \n" + "\(self.countDistance(loc1Latitude: self.locationManager.location?.coordinate.latitude ?? self.store[i].latitudeCoordinate, loc1Longitude: self.locationManager.location?.coordinate.longitude ?? self.store[i].longitudeCoordinate, loc2Latitude: self.store[i].latitudeCoordinate, loc2Longitude: self.store[i].longitudeCoordinate)) KM"
                            self.annotatedMoneyChanger.append(pointAnnotation) // Now append this newly created annotation to array.
                        }
                        print(decodedMC)
                    }
                }else {
                    print("No Data\n\n")
                }
            } catch {
                print ("Error data1\n\n")
            }
        }.resume()
    }
    //    <<--Setelah ini diupload ke dalam init dipanggil load() -->
    
}
