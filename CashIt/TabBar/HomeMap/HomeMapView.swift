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
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails: Bool = false
    @State var locValue: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var body: some View {
        ZStack{
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, locValue: $locValue, annotations: viewModel.annotatedMoneyChanger)
                .edgesIgnoringSafeArea(.all)
                .onAppear(){
                    locValue = viewModel.locationManager.location?.coordinate ?? CLLocationCoordinate2D()
                    
                }
            
            if showingPlaceDetails{
                let loc1 = CLLocation(latitude: locValue.latitude,longitude: locValue.longitude)
                let loc2 = CLLocation(latitude: selectedPlace?.coordinate.latitude ?? centerCoordinate.latitude, longitude: selectedPlace?.coordinate.longitude ?? centerCoordinate.longitude)
                let distance = Float(loc1.distance(from: loc2 ))
                
                VStack{
                    Spacer()
                    VStack{
                        PlaceDetails(selectedPlace: $selectedPlace, distance: distance)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.93, height: UIScreen.main.bounds.height/6, alignment: .topLeading)
                    .border(Color.black, width: 1)
                    .background(Color(.white))
                    
                }
            }

        }
        .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.8)
        .navigationBarHidden(true)
    }
}

struct HomeMapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMapView()
    }
}
