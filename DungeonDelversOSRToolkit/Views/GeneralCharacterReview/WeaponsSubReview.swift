//
//  WeaponsSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct WeaponsSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = WeaponsSubReviewModel()

  var body: some View {
    let weapons = viewModel.getWeapons(for: player)
    ForEach(weapons, id: \.name) { weapon in
      WeaponReviewItem(weapon: weapon)
    }
    if !player.ammo.isEmpty {
      VStack {
        Subtitle(content: "Ammo")
          .frame(maxWidth: .infinity, alignment: .leading)
        let ammoNames = player.ammo.map { $0.name }
        Text("\(ammoNames.joined(separator: ", "))")
          .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
  }
}

#Preview {
  let player = PlayerCharacter()
  player.weapons.append(.battleAxe)
  player.weapons.append(.shortBow)
  player.weapons.append(.dagger)
  player.ammo.append(.arrows)
  return WeaponsSubReview()
    .environment(player)
}
