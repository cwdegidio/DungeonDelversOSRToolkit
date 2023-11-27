//
//  SavingThrowsSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class SavingThrowsSubReviewModel {
  func getSavingThrowContent(for savingThrow: SavingThrow, using player: PlayerCharacter) -> ReviewItemModel {
    var name = ""
    var value = 0
    if let firstCharacter = savingThrow.name.first {
      name = firstCharacter.uppercased()
    }

    if let characterClass = player.characterClass {
      value = characterClass.savingThrowsAtLevel1[savingThrow] ?? 0
    }

    let longDescription = savingThrow.name

    return ReviewItemModel(name: name, valueInt: value, subText: longDescription)
  }

  func getMagicSaveBonus(for player: PlayerCharacter) -> ReviewItemModel {
    let name = "±"
    var bonus = 0
    if let modifier = player.modifiers.first(where: { $0.modType == .magicSaves }),
      let wisdom = player.abilityScores.first(where: { $0.statType == .wis }) {
      bonus = ModCalculator().getValue(for: modifier, using: wisdom.score)
    }
    let bonusString = ModifierViewModel().getNumericBonusString(for: bonus)
    let subText = "WIS modifier to saves vs magic"

    return ReviewItemModel(name: name, valueStr: bonusString, subText: subText)
  }
}
