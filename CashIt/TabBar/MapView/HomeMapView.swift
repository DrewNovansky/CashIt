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
    @State var locValue: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0,longitude: 0)
    @State var showView: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, locValue: $locValue, annotations: viewModel.annotatedMoneyChanger)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear(){
                        locValue = viewModel.locationManager.location?.coordinate ?? CLLocationCoordinate2D()
                    }
                
                if showingPlaceDetails{
                    let distance = viewModel.countDistance(loc1Latitude: locValue.latitude, loc1Longitude: locValue.longitude, loc2Latitude: selectedPlace?.coordinate.latitude ?? centerCoordinate.latitude, loc2Longitude: selectedPlace?.coordinate.longitude ?? centerCoordinate.longitude)/1000
                    VStack{
                        Spacer()
                        NavigationLink(destination: viewModel.segue(showView: $showView, distance: distance, moneyChanger: viewModel.store[0]), isActive: $showView){
                            VStack{
                                PlaceDetails(selectedPlace: $selectedPlace)
                                    .padding(10)
                            }
                            .onTapGesture {
                                showView.toggle()
                            }
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/7, alignment: .topLeading)
                            .border(Color.black, width: 1)
                            .background(Color(.white))
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct HomeMapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMapView()
    }
}
