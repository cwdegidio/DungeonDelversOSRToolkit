//
//  CharacterBioViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import Foundation

class CharacterBioViewModel {
  func getNumberOfLanguages(for player: PlayerCharacter) -> Int {
    guard let intStat = player.abilityScores.first(where: { $0.statType == .int }) else {
      print("[ ERROR ] Ability not available")
      return 0
    }

    guard let modifier = player.modifiers.first(where: { $0.modType == Mod.spokenLanguage }) else {
      print("[ ERROR ] No modifier available")
      return 0
    }

    return ModCalculator().getValue(for: modifier, using: intStat.score) - 2
  }
}
