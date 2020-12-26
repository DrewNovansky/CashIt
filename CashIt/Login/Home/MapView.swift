//
//  MapView.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 05/10/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    var annotations: [MKPointAnnotation]
    
    let locationManager = CLLocationManager()
        func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.showsUserLocation = true

            // Ask for Authorisation from the User.
            self.locationManager.requestAlwaysAuthorization()

            // For use in foreground
            self.locationManager.requestWhenInUseAuthorization()

            if CLLocationManager.locationServicesEnabled() {
                //        self.locationManager.delegate = self
                 self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                 self.locationManager.startUpdatingLocation()

                //Temporary fix: App crashes as it may execute before getting users current location
                //Try to run on device without DispatchQueue

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    let locValue:CLLocationCoordinate2D = self.locationManager.location!.coordinate
                    print("CURRENT LOCATION = \(locValue.latitude) \(locValue.longitude)")

                    let coordinate = CLLocationCoordinate2D(
                        latitude: locValue.latitude, longitude: locValue.longitude)
                    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    let region = MKCoordinateRegion(center: coordinate, span: span)
                    view.setRegion(region, animated: true)
                })
            }
                if annotations.count != view.annotations.count{
                    view.removeAnnotations(view.annotations)
                    view.addAnnotations(annotations)
                }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject,MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "Placemark"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier )
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                
            }
            else {
                annotationView?.annotation = annotation
            }
            return annotationView
        }
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let placemark = view.annotation as? MKPointAnnotation else { return }

                parent.selectedPlace = placemark
                parent.showingPlaceDetails = true
        }
    }
}

extension MKPointAnnotation{
    static var example: MKPointAnnotation{
        let annotation = MKPointAnnotation()
        annotation.title = "Monas"
        annotation.subtitle = "Monumen Nasional made in Indonesia with a ton of gold"
        annotation.coordinate = CLLocationCoordinate2D(latitude: -6.1754, longitude: 106.8272)
        return annotation
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), selectedPlace: .constant(MKPointAnnotation.example), showingPlaceDetails: .constant(false), annotations: [MKPointAnnotation.example])
    }
}
