//
//  AmmoTabList.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct AmmoTabList: View {
  var body: some View {
    NavigationStack {
      ZStack {
        GlobalBackground()
        List {
          ScrollView {
            ForEach(Ammo.allCases, id: \.self) { ammo in
              NavigationLink(destination: AmmoDetail(ammo: ammo)) {
                EquipmentListItem(itemName: ammo.name, itemImage: ammo.imgName, itemCost: ammo.cost)
                Image(systemName: "chevron.forward")
              }
              .padding()
            }
          }
        }
        .navigationTitle("Ammunition")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
      }
    }
    .scrollContentBackground(.hidden)
  }
}


#Preview {
  AmmoTabList()
}
