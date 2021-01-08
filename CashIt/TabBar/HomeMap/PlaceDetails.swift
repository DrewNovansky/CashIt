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
            VStack{
            Text("\(selectedPlace?.title ?? "Unknown")")
            Text("\(selectedPlace?.subtitle ?? "Missing place information")")
                
                Text("\(distance, specifier: "%.2f") Meter")
            }
            .padding(30)
            .padding(.leading, 30.0)
            .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height/10, alignment: .leading)
            Spacer()
            VStack{
                
            }
        }
    }
}

struct PlaceDetails_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hai")
    }
}
