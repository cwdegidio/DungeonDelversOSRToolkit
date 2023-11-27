//
//  EncounterSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class EncounterSubReviewModel {
  func getInitModifier(for player: PlayerCharacter) -> ReviewItemModel {
    var bonus = 0
    if let modifier = player.modifiers.first(where: { $0.modType == .initiative }),
      let dexterity = player.abilityScores.first(where: { $0.statType == .dex }) {
      bonus = ModCalculator().getValue(for: modifier, using: dexterity.score)
    }

    if let characterClass = player.characterClass, characterClass == .halfling {
      bonus += 1
    }

    let initBonus = ModifierViewModel().getNumericBonusString(for: bonus)

    return ReviewItemModel(name: "Init", valueStr: initBonus, subText: "DEX modifier to initiative")
  }

  func getReactionBonus(for player: PlayerCharacter) -> ReviewItemModel {
    var bonus = 0
    if let modifier = player.modifiers.first(where: { $0.modType == .npcReaction }),
      let charisma = player.abilityScores.first(where: { $0.statType == .cha }) {
      bonus = ModCalculator().getValue(for: modifier, using: charisma.score)
    }

    let reactionBonus = ModifierViewModel().getNumericBonusString(for: bonus)

    return ReviewItemModel(name: "±", valueStr: reactionBonus, subText: "CHA modifier to reaction rolls")
  }
}
