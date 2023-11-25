//
//  EquipmentListItem.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import SwiftUI

struct EquipmentListItem: View {
  let itemName: String
  let itemImage: String
  let itemCost: Int

  var body: some View {
    VStack {
      HStack(alignment: .top) {
        Image(itemImage)
          .resizable()
        .frame(width: 60, height: 60)
        VStack(alignment: .leading) {
          Spacer()
          Subtitle(content: itemName)
          Text("**Cost:** \(itemCost)gp")
        }
        Spacer()
      }
      .frame(height: 60)
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  let armor = Armor.leather
  return EquipmentListItem(
    itemName: armor.name,
    itemImage: armor.imgName,
    itemCost: armor.cost
  )
}
