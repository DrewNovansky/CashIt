//
//  SegmentControl.swift
//  CashIt
//
//  Created by Andrew Novansky Ignatius on 02/01/21.
//

import SwiftUI

struct SegmentControl: View {
    @Binding var selectedTab: Int
    @Binding var segment: [String]
    var body: some View {
        Picker(selection: $selectedTab, label: Text("How do you want to search the stores")) {
            ForEach(0 ..< segment.count) { index in
                Text(self.segment[index]).tag(index)
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct SegmentControl_Previews: PreviewProvider {
    static var previews: some View {
    Text("")
    }
}
