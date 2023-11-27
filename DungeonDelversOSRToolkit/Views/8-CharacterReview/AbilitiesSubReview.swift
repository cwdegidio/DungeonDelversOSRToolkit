//
//  AbilitiesSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import SwiftUI

struct AbilitiesSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = AbilitySubReviewModel()

  var body: some View {
    VStack(alignment: .leading) {
      Text("**Ability check:** _Roll under or equal on 1d20_")
        .font(.footnote)
      ForEach(player.abilityScores, id: \.statType) { stat in
        let data = viewModel.getStatContent(for: stat, using: player)
        ReviewItem(
          itemName: data.name,
          itemValue: String(describing: data.value),
          subText: data.subText
        )
      }
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
    CharacterAbility(statType: .wis, score: 10),
    CharacterAbility(statType: .cha, score: 12)
  ]
  return AbilitiesSubReview()
    .environment(player)
}
