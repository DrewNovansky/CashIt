//
//  PlaceDetails.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 06/01/21.
//

import SwiftUI
import MapKit

struct PlaceDetails: View {
    @Binding var selectedPlace: MKPointAnnotation?
    var distance: Float
    var body: some View {
        HStack{
            Image("Test")
                .resizable()
                .scaledToFit()
                .frame(width:  UIScreen.main.bounds.height/10, height:  UIScreen.main.bounds.height/10)
                .clipShape(Circle())
            VStack(alignment:.leading){
                Text("\(selectedPlace?.title ?? "Unknown")")
                Text("\(selectedPlace?.subtitle ?? "Missing place information")")
                Text("\(distance, specifier: "%.2f") Meter")
            }
            .font(.title3)
            .foregroundColor(.black)
        }.padding([.top, .leading], 24.0)
       
    }
}
