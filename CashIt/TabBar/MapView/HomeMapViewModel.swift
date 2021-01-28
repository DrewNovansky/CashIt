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
        self.store.append(contentsOf: [
            MoneyChanger(moneyChangerName: "Surya Money Changer",photo: "Test", address: "Central Park Mall Lantai B 30A",whatsappLink: "wa.me/6281243658709", phoneNumber: "081234658709",latitudeCoordinate:-6.1774,longitudeCoordinate: 106.7907),
            MoneyChanger(moneyChangerName: "Tiga Saudara Money Changer",photo: "Test", address: "Taman Anggrek Lantai 1 29B",whatsappLink: "wa.me/084681809919", phoneNumber: "084681809919",latitudeCoordinate:-6.1785,longitudeCoordinate: 106.7922),
            MoneyChanger(moneyChangerName: "Rainbow Bridge Money Changer", photo: "Test", address: "Jl.Raya Kb.Jeruk Gg.H. Salbini No.27 RT.1 RW.9",whatsappLink: "wa.me/6281291286046", phoneNumber: "081291286046",latitudeCoordinate:-6.2018528,longitudeCoordinate: 106.782557)
        ])
        
        for i in 0..<(store.count)
        {
            //untuk membuat titik annotate
            let pointAnnotation = MKPointAnnotation() // First create an annotation.
            pointAnnotation.title = store[i].moneyChangerName
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
    func segue(showView: Binding<Bool>, distance: Double) -> MCProfileView {
        let viewModel = MCProfileViewModel()
        viewModel.distance = self.distance
        //terima parameter
        let view = MCProfileView(rootIsActive: showView)
        return view
    }
    
    //        func load() {
    //            let url = URL(string: "https://gist.githubusercontent.com/rbreve/60eb5f6fe49d5f019d0c39d71cb8388d/raw/f6bc27e3e637257e2f75c278520709dd20b1e089/movies.json")!
    //
    //            URLSession.shared.dataTask(with: url) {(data,response,error) in
    //                do {
    //                    if let d = data {
    //                        let decodedMC = try JSONDecoder().decode([MoneyChanger].self, from: d)
    //                        DispatchQueue.main.async {
    //                            self.store = decodedMC
    //                        }
    //                    }else {
    //                        print("No Data")
    //                    }
    //                } catch {
    //                    print ("Error")
    //                }
    //            }.resume()
    //        }
    //    <<--Setelah ini diupload ke dalam init dipanggil load() -->
    
}
