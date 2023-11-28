//
//  GearTabList.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct GearTabList: View {
  var body: some View {
    NavigationStack {
      ZStack {
        GlobalBackground()
        List {
          ScrollView {
            ForEach(Gear.allCases, id: \.self) { gear in
              NavigationLink(destination: GearDetail(gear: gear)) {
                EquipmentListItem(itemName: gear.name, itemImage: gear.imgName, itemCost: gear.cost)
                Image(systemName: "chevron.forward")
              }
              .padding()
            }
          }
        }
        .navigationTitle("Gear")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
      }
    }
    .scrollContentBackground(.hidden)
  }
}

#Preview {
  GearTabList()
}
