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
    var body: some View {
        HStack{
            Image("Test")
                .resizable()
                .scaledToFit()
                .frame(width:  UIScreen.main.bounds.height/10, height:  UIScreen.main.bounds.height/10)
                .clipShape(Circle())
            VStack(alignment:.leading){
                Text("\(selectedPlace?.title ?? "Unknown")")
                    .fontWeight(.semibold)
                Text("\(selectedPlace?.subtitle ?? "Missing place information")")
                    .font(.caption)
            }
            .font(.body)
            .foregroundColor(.black)
        }.padding(.leading, 25)
        .padding(.top, 10)
        
    }
}
