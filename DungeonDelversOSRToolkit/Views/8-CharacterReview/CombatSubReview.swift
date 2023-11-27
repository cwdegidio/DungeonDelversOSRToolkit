//
//  CombatSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import SwiftUI

struct CombatSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = CombatSubReviewModel()

  var body: some View {
    VStack(alignment: .leading) {
      ForEach(CombatValue.allCases, id: \.self) { combatValue in
        let data = viewModel.getCombatData(for: combatValue, using: player)
        ReviewItem(itemName: data.name, itemValue: String(describing: data.value), subText: data.subText)
      }
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
    CharacterAbility(statType: .str, score: 17),
    CharacterAbility(statType: .dex, score: 15),
    CharacterAbility(statType: .con, score: 8),
    CharacterAbility(statType: .int, score: 18),
    CharacterAbility(statType: .wis, score: 15),
    CharacterAbility(statType: .cha, score: 12)
  ]
  player.pcHitPoints = 5
  player.characterClass = .cleric
  player.armor = .chainmail
  player.hasShield = true
  return CombatSubReview()
    .environment(player)
}
