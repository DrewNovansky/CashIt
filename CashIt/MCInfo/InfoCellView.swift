//
//  InfoCellView.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import SwiftUI

struct InfoCellView: View {
    
    var operationalHour: OperationalHours
    
    var body: some View {
        HStack{
            HStack{
                Text(operationalHour.dayName)
                Spacer()
            }
            
            HStack{
                if(operationalHour.isOpen == true){
                    Text(operationalHour.openHour + " - " + operationalHour.closeHour)
                }else {
                    Text("Closed")
                }
                Spacer()
            }
        }.font(.system(size: 17))
    }
}

struct InfoCellView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCellView(operationalHour: OperationalHours(dayName: "Monday", isOpen: false, openHour: "0", closeHour: "0"))
    }
}
