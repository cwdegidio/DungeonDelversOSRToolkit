//
//  Weapons.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct Weapons: View {
  var body: some View {
    NavigationStack {
      ZStack {
        GlobalBackground()
        List {
          ScrollView {
            ForEach(Weapon.allCases, id: \.self) { weapon in
              NavigationLink(destination: WeaponDetail(weapon: weapon)) {
                EquipmentListItem(itemName: weapon.name, itemImage: "aLeather", itemCost: weapon.cost)
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
  Weapons()
}
