//
//  AdvancementSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct AdvancementSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = AdvancementSubReviewModel()

  var body: some View {
    VStack(alignment: .leading) {
      let nextLevelData = viewModel.getNextLevelXP(for: player)
      ReviewItem(
        itemName: nextLevelData.name,
        itemValue: String(describing: nextLevelData.value),
        subText: nextLevelData.subText
      )
      let xpBonusData = viewModel.getXPBonus(for: player)
      ReviewItem(
        itemName: xpBonusData.name,
        itemValue: String(describing: xpBonusData.value),
        subText: xpBonusData.subText
      )
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  let player = PlayerCharacter()
  player.name = "Drizzt D'Orden"
  player.title = "Destroyer of Men"
  player.alignment = .chaos
  player.abilityScores = [
    CharacterAbility(statType: .str, score: 13),
    CharacterAbility(statType: .dex, score: 18),
    CharacterAbility(statType: .con, score: 8),
    CharacterAbility(statType: .int, score: 13),
    CharacterAbility(statType: .wis, score: 15),
    CharacterAbility(statType: .cha, score: 12)
  ]
  player.characterClass = .elf
  return AdvancementSubReview()
    .environment(player)
}
