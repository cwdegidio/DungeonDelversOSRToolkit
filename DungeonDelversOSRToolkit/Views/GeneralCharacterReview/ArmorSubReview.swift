//
//  ArmorSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct ArmorSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = ArmorSubReviewModel()

  var body: some View {
    VStack(alignment: .leading) {
      let armorString = viewModel.getArmor(for: player)
      Text("\(armorString)")
        .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

#Preview {
  let player = PlayerCharacter()
  player.armor = .chainmail
  player.hasShield = true
  return ArmorSubReview()
    .environment(player)
}
