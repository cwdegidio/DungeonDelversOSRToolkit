//
//  MovementSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct MovementSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = MovementSubReviewModel()

  var body: some View {
    VStack(alignment: .leading) {
      Text("_Base mv. rate = 120, unless encumbered_")
        .font(.footnote)
      ForEach(Movement.allCases, id: \.self) { movement in
        let data = viewModel.getMovement(for: movement, using: player)
        ReviewItem(itemName: data.name, itemValue: String(describing: data.value), subText: data.subText)
      }
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  let player = PlayerCharacter()
  player.abilityScores = [
    CharacterAbility(statType: .str, score: 17),
    CharacterAbility(statType: .dex, score: 18),
    CharacterAbility(statType: .con, score: 8),
    CharacterAbility(statType: .int, score: 18),
    CharacterAbility(statType: .wis, score: 16),
    CharacterAbility(statType: .cha, score: 18)
  ]
  player.characterClass = .elf
  player.coins.updateValue(801, forKey: .goldPieces)
  return MovementSubReview()
    .environment(player)
}
