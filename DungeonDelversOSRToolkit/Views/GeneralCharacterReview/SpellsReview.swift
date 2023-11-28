//
//  SpellsReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct SpellsReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = SpellSubReviewModel()

  var body: some View {
    let spells = viewModel.getMagicUserSpells(for: player)
    Text(spells.joined(separator: ", "))
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {
  let player = PlayerCharacter()
  player.spells.append(.charmPerson)
  return SpellsReview()
    .environment(player)
}
