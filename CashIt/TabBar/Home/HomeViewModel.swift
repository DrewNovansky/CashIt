//
//  HomeViewModel.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 29/12/20.
//

import Foundation

class HomeViewModel: ObservableObject {
    var store: [Store] = []
    
    // Dummy Data
    init() {
        self.store.append(contentsOf: [
            Store(storeName: "Andrew MC", storePrice: 14000, storeLogo: "Test", storeAddress: "Kp Janis"),
            Store(storeName: "Evan MC", storePrice: 15000, storeLogo: "Test", storeAddress: "Palmerah"),
            Store(storeName: "Sherwin MC", storePrice: 14500, storeLogo: "Test", storeAddress: "Riau"),
            Store(storeName: "Dana MC", storePrice: 12000, storeLogo: "Test", storeAddress: "Puncak Monas"),
            Store(storeName: "Maju Roso MC", storePrice: 11000, storeLogo: "Test", storeAddress: "Emasnya Monas")
                ])
        store.sort {
            $0.storePrice < $1.storePrice
        }
    }
    
    func getStore(index: Int) -> Store {
        return store[index]
    }
    
    func segue() -> MCProfileView {
        let viewModel = MCProfileViewModel()//terima parameter
        let view = MCProfileView(viewModel: viewModel, isTopNavigationActive: false)
        return view
    }
}
