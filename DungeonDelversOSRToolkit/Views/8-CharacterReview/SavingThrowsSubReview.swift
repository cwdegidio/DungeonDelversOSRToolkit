//
//  SavingThrowsSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import SwiftUI

struct SavingThrowsSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = SavingThrowsSubReviewModel()

  var body: some View {
    VStack(alignment: .leading) {
      Text("**Saving throw:** _Roll over or equal on 1d20_")
        .font(.footnote)
      ForEach(SavingThrow.allCases, id: \.self) { savingThrow in
        let data = viewModel.getSavingThrowContent(for: savingThrow, using: player)
        ReviewItem(
          itemName: data.name,
          itemValue: String(describing: data.value),
          subText: data.subText
        )
      }
      let data = viewModel.getMagicSaveBonus(for: player)
      ReviewItem(
        itemName: data.name,
        itemValue: String(describing: data.value),
        subText: data.subText)
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  let player = PlayerCharacter()
  player.abilityScores = [
    CharacterAbility(statType: .str, score: 17),
    CharacterAbility(statType: .dex, score: 9),
    CharacterAbility(statType: .con, score: 8),
    CharacterAbility(statType: .int, score: 18),
    CharacterAbility(statType: .wis, score: 16),
    CharacterAbility(statType: .cha, score: 12)
  ]
  player.characterClass = .cleric
  return SavingThrowsSubReview()
    .environment(player)
}
