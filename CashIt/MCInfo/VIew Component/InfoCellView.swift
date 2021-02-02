//
//  InfoCellView.swift
//  CashIt
//
//  Created by Evan Renanto on 01/01/21.
//

import SwiftUI

struct InfoCellView: View {
    
    var operationalHour: OfficeHour
    
    var body: some View {
        HStack{
            HStack{
                Text(operationalHour.day)
                Spacer()
            }
            
            HStack{
//                Commented Conditional
                Text(operationalHour.openTime + " - " + operationalHour.closeTime)
//                if(operationalHour.isOpen == true){
//
//                }else {
//                    Text("Tutup")
//                }
                Spacer()
            }
        }.font(.system(size: 17))
    }
}

struct InfoCellView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCellView(operationalHour: OfficeHour(officeHourId: 0,day: "Monday",  openTime: "0", closeTime: "0"))
    }
}
