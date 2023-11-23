//
//  CharacterDetailsViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/19/23.
//

import SwiftUI

class CharacterDetailsViewModel {
  func generateStartingGold(for player: PlayerCharacter) {
    let startingdGoldMultiplier = 10
    let startingGoldRange = 3...18
    let startingGold = Int.random(in: startingGoldRange) * startingdGoldMultiplier
    player.coins.updateValue(startingGold, forKey: .goldPieces)
  }

  func setPlayerAlignment(_ alignment: Alignment, for player: PlayerCharacter) {
    player.alignment = alignment
  }

  func generateCharactersMaxHP(hitPoints: Int, for player: PlayerCharacter) {
    let conModifier = getHPModifierValue(for: player)

    if hitPoints + conModifier <= 0 {
      player.pcHitPoints = 1
    } else {
      player.pcHitPoints = hitPoints + conModifier
    }
  }

  func getHPModifierValue(for player: PlayerCharacter) -> Int {
    if let hpModifier = player.modifiers.first(where: { $0.modType == Mod.hitPoints }),
      let conScore = player.abilityScores.first(where: { $0.statType == .con })?.score {
      return ModCalculator().getValue(for: hpModifier, using: conScore)
    } else {
      // TODO: Be sure to add error.
      return 0
    }
  }
}
