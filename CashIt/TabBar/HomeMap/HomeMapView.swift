//
//  HomeMapView.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 04/01/21.
//

import SwiftUI
import MapKit

struct HomeMapView: View {
    @ObservedObject var viewModel = HomeMapViewModel()
    @State private var centerCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    @State private var annotatedMoneyChanger: [MKPointAnnotation] = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails: Bool = false
    @State var locValue: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    let locationManager = CLLocationManager()
    var body: some View {
        ZStack{
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, locValue: $locValue, annotations: annotatedMoneyChanger)
                .edgesIgnoringSafeArea(.all)
                .onAppear(){
                    let monasExample = MKPointAnnotation()
                    monasExample.coordinate = CLLocationCoordinate2D(latitude: -6.175498079151794 , longitude: 106.82726958474876)
                    monasExample.title = "Monas Money Changer"
                    self.annotatedMoneyChanger.append(monasExample)
                    let monasExample1 = MKPointAnnotation()
                    monasExample1.coordinate = CLLocationCoordinate2D(latitude: -6.1375 , longitude: 106.8046)
                    monasExample1.title = "Monas Money"
                    self.annotatedMoneyChanger.append(monasExample1)
                    locValue = self.locationManager.location?.coordinate ?? CLLocationCoordinate2D()
                    
                }
            
            if showingPlaceDetails{
                let loc1 = CLLocation(latitude: locValue.latitude,longitude: locValue.longitude)
                let loc2 = CLLocation(latitude: selectedPlace?.coordinate.latitude ?? centerCoordinate.latitude, longitude: selectedPlace?.coordinate.longitude ?? centerCoordinate.longitude)
                let distance = Float(loc1.distance(from: loc2 ))
                
                VStack{
                    Spacer()
                    VStack{
                        HStack{
                            VStack{
                            Text("\(selectedPlace?.title ?? "Unknown")")
                            Text("\(selectedPlace?.subtitle ?? "Missing place information")")
                                
                                Text("\(distance, specifier: "%.2f") Meter")
                                    .onAppear(perform: {
                                        print("\(locValue.latitude) and \(locValue.longitude) \n\n\n\n\n\n\n\n\n\n\n\n\n\n")
                                    })
                                
                            }
                            .padding(30)
                            .padding(.leading, 30.0)
                            .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height/10, alignment: .leading)
                            Spacer()
                            VStack{
                                
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width*0.93, height: UIScreen.main.bounds.height/6, alignment: .topLeading)
                    .border(Color.black, width: 1)
                    .background(Color(.white))
                    
                }
            }

        }
        .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.8)
    }
}

struct HomeMapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMapView()
    }
}
