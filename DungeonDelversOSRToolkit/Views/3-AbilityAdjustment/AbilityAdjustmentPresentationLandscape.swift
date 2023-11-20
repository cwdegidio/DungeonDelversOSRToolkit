//
//  AbilityAdjustmentPresentationLandscape.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/18/23.
//

import SwiftUI

struct AbilityAdjustmentPresentationLandscape: View {
  @EnvironmentObject var player: PlayerCharacter
  @Binding var pointsPool: Int
  @Binding var tempStatsScores: [Ability]
  let modCalculator: ModCalculator
  let viewModel: AbilityAdjustmentViewModel

  var body: some View {
    HStack {
      AbilityAdjustmentLandscapeFlourish(
        characterClass: player.characterClass?.name ?? "No class selected",
        xpBonus: "\(modCalculator.calculateXPAdjustment(for: player))%",
        abilityTitle: "XP Bonus",
        pointsPool: $pointsPool
      )
      .padding(.horizontal)
      VStack {
        ForEach($tempStatsScores, id: \.statType) { $thisCharAbility in
          if viewModel.isStatAdjustable(for: thisCharAbility.statType, using: player) {
            AdjustmentBlock(
              charAbility: $thisCharAbility,
              pointsPool: $pointsPool,
              viewModel: viewModel
            )
          }
        }
      }
      .padding(.trailing)
    }
    .padding(.top)
  }
}

#Preview {
  let player = PlayerCharacter()
  player.abilityScores = [
    CharacterAbility(statType: .str, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
  ]
  player.characterClass = CharacterClass.thief

  let statScores = player.abilityScores
  return AbilityAdjustmentPresentationLandscape(
    pointsPool: .constant(10),
    tempStatsScores: .constant(statScores),
    modCalculator: ModCalculator(),
    viewModel: AbilityAdjustmentViewModel()
  )
  .environment(player)
}
