//
//  WeaponReviewItem.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct WeaponReviewItem: View {
  let weapon: WeaponReviewModel

  var body: some View {
    VStack(alignment: .leading) {
      ZStack {
        Rectangle()
          .stroke()
          .frame(maxWidth: .infinity)
          .frame(height: 40)
          .background(Color.white)
        HStack {
          Text(weapon.name)
            .font(.title3)
            .frame(height: 30)
            .padding(5)
            .background(Color.black)
            .foregroundStyle(Color.white)
          Spacer()
          Text("**Dmg:** \(weapon.damage)")
          Spacer()
          Text("**Wt:** \(weapon.weight)")
            .padding(.trailing, 10)
        }
      }
      VStack {
        Text("**Qualities:** \(weapon.qualities.joined(separator: ", "))")
          .font(.subheadline)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
    .padding(.bottom, 10)
  }
}

#Preview {
  let weapon = WeaponReviewModel(
    name: "Battle Axe",
    damage: "1d8",
    weight: "40 coins",
    qualities: ["Two-handed", "Melee"]
  )
  return WeaponReviewItem(weapon: weapon)
}
