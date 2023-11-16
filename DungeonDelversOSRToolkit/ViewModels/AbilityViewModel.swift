//
//  AbilityViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import Foundation

class AbilityViewModel {
  func setSingleAbilityScore(for player: PlayerCharacter, onAbility stat: Stat) {
    if let i = player.abilityScores.firstIndex(where: { $0.statType == stat }) {
      player.abilityScores[i].score = Int.random(in: 3...18)
    }
  }

  func setAllAbilityScores(for player: PlayerCharacter) {
    for i in player.abilityScores.indices {
      player.abilityScores[i].score = Int.random(in: 3...18)
    }
  }

  func getAbilityScoreAndName(for player: PlayerCharacter, with stat: Stat) -> (String, Int) {
    let statShortName = stat.shortName
    let score = player.abilityScores.first { $0.statType == stat }?.score ?? 0
    return (statShortName, score)
  }
}
