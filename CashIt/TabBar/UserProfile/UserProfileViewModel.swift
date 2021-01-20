//
//  UserProfileViewModel.swift
//  CashIt
//
//  Created by Evan Renanto on 09/01/21.
//

import Foundation

class UserProfileViewModel{
    var user: User = User()
   
    func segueToHistory() -> HistoryView {
        let viewModel = HistoryViewModel()//terima parameter
        let view = HistoryView(viewModel: viewModel)
        return view
    }
}
