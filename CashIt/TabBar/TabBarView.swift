//
//  TabBarVIew.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 04/01/21.
//

import SwiftUI

struct TabBarView: View {
    @Binding var rootIsActive: Bool
    var body: some View {
        NavigationView{
            TabView{
                HomeView()
                    .tabItem {
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Harga") }
                HomeMapView()
                    .tabItem {
                        Image(systemName: "mappin.circle.fill")
                        Text("Peta") }
                UserProfileView(rootIsActive: $rootIsActive)
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                        Text("Profil")
                    }
            }
            .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct TabBarVIew_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(rootIsActive: .constant(false))
    }
}
