//
//  EncountersSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct EncountersSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = EncounterSubReviewModel()

  var body: some View {
    VStack(alignment: .leading) {
      let initData = viewModel.getInitModifier(for: player)
      ReviewItem(
        itemName: initData.name,
        itemValue: String(describing: initData.value),
        subText: initData.subText
      )

      let reactionData = viewModel.getReactionBonus(for: player)
      ReviewItem(
        itemName: reactionData.name,
        itemValue: String(describing: reactionData.value),
        subText: reactionData.subText
      )
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
  player.characterClass = .fighter
  return EncountersSubReview()
    .environment(player)
}
