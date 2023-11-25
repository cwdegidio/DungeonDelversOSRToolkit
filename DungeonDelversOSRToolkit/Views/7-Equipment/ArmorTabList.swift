//
//  ArmorTabList.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct ArmorTabList: View {
  var body: some View {
    NavigationStack {
      ZStack {
        GlobalBackground()
        List {
          ScrollView {
            ForEach(Armor.allCases, id: \.self) { armor in
              NavigationLink(destination: ArmorDetail(armor: armor)) {
                EquipmentListItem(itemName: armor.name, itemImage: armor.imgName, itemCost: armor.cost)
                Image(systemName: "chevron.forward")
              }
              .padding()
            }
          }
        }
        .navigationTitle("Armor")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
      }
    }
    .scrollContentBackground(.hidden)
  }
}

#Preview {
  ArmorTabList()
}
