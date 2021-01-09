//
//  TabBarVIew.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 04/01/21.
//

import SwiftUI

struct TabBarVIew: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Harga") }
            HomeMapView()
                .tabItem {
                    Image(systemName: "mappin.circle.fill")
                    Text("Peta") }
            UserProfileView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profil")
                }
        }.navigationBarHidden(true)
    }
}

struct TabBarVIew_Previews: PreviewProvider {
    static var previews: some View {
        TabBarVIew()
    }
}
