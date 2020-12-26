//
//  HomeView.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 25/11/20.
//

import SwiftUI
import MapKit

struct store : Identifiable,Decodable,Hashable {
    var id: Int
    let storeName: String
    let storePrice: String
    let storeLogo: String
    let storeAddress: String
}
var stores = [
    store(id: 0, storeName: "Andrew MC", storePrice: "14000", storeLogo: "Test", storeAddress: "Kp Janis"),
    store(id: 1, storeName: "Evan MC", storePrice: "15000", storeLogo: "Test", storeAddress: "Kp Palmerah"),
    store(id: 2, storeName: "Sherwin MC", storePrice: "14500", storeLogo: "Test", storeAddress: "Riau"),
    store(id: 3, storeName: "Dana MC", storePrice: "12000", storeLogo: "Test", storeAddress: "Puncak Monas")
]
let sortedStores = stores.sorted {$0.storePrice < $1.storePrice}

struct HomeView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    @State private var searchText : String = ""
    @State var selectedTab: Int = 0
    @State private var segment = ["Price","Map"]
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    var body: some View {
        
        ZStack{
            VStack {
                Picker(selection: $selectedTab, label: Text("How do you want to search the stores")) {
                    ForEach(0 ..< segment.count) { index in
                        Text(self.segment[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                if segment[selectedTab] == "Price"{
                    VStack{
                        SearchBar(text: $searchText, placeholder: "Search money changer store")
                        // this is for dropdown menu
                        HStack{
                            VStack{
                                HStack{
                                    DropDown()
                                }.zIndex(5)
                                Divider()
                                HStack{
                                    DropDown()
                                }.zIndex(4)
                            }.frame(height: UIScreen.main.bounds.height*0.15)
                            .border(Color.black, width: 1)
                            .zIndex(2)
                        }.zIndex(3)
                        List{
                            ForEach(sortedStores.filter {
                                self.searchText.isEmpty ? true : $0.storeName.lowercased().contains(self.searchText.lowercased())
                            }, id: \.self) { item in
                                HStack(alignment: .top){
                                    
                                    Image("\(item.storeLogo)")
                                        .clipShape(Circle())
                                        .padding()
                                    
                                    VStack(alignment:.leading){
                                        Text("\(item.storeName)")
                                        Text("\(item.storeAddress)")
                                    }
                                    Spacer()
                                    Text("\(item.storePrice)")
                                }
                            }
                        }.border(Color.black, width: 1)
                    }
                }
                else if segment[selectedTab] == "Map"{
                    ZStack{
                        MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                            .edgesIgnoringSafeArea(.all)
                            .onAppear(){
                                let monasExample = MKPointAnnotation()
                                monasExample.coordinate = CLLocationCoordinate2D(latitude: -6.175498079151794 , longitude: 106.82726958474876)
                                monasExample.title = "Monas Money Changer"
                                self.locations.append(monasExample)
                            }
                        if showingPlaceDetails{
                            VStack{
                                Spacer()
                                VStack{
                                    HStack{
                                        VStack{
                                        Text("\(selectedPlace?.title ?? "Unknown")")
                                        Text("\(selectedPlace?.subtitle ?? "Missing place information")")
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
//                        .alert(isPresented: $showingPlaceDetails) {
//                            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
//                                // edit this place
//                            })
//                        }
                    }
                }
            }
            .padding()
        }
    }
}

//Mark SearchBar Template
struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    var placeholder: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
}

var currencies = ["IDR","USD","KRW","RGM"]

struct DropDown:View {
    @State var expand = false
    @State var text = currencies[0]
    var body: some View{
        ZStack{
            VStack{
                HStack{
                    Text("\(text)").fontWeight(.semibold)
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 10, height: 5)
                    
                }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height*0.05, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(expand ? Color("AccentColor") : Color.gray, lineWidth: 3)
                )
                .onTapGesture(perform: {
                    self.expand.toggle()
                })
            }.animation(.spring())
            if expand{
                ForEach(0..<currencies.count){
                    currency in
                    DropDownElement(element: currencies[currency], expand: expand, text: $text)
                        .offset(y: UIScreen.main.bounds.height * (0.055 * CGFloat((currency + 1))))
                }
            }
            //
            
        }
    }
}

struct DropDownElement:View {
    var element = "test"
    @State var expand:Bool
    @Binding var text:String
    var body : some View{
        Button(action: {
            text = "\(element)"
        }, label: {
            Text("\(element)")
                .padding()
        })
        .foregroundColor(Color(.black))
        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height*0.05, alignment: .center)
        .background(Color(.white))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(expand ? Color("AccentColor") : Color.gray, lineWidth: 3)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
