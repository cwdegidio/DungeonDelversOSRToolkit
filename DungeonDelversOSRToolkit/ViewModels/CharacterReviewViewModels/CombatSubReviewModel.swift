//
//  CombatSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class CombatSubReviewModel {
  func getCombatData(for combatValue: CombatValue, using player: PlayerCharacter) -> ReviewItemModel {
    switch combatValue {
    case .armorClass:
      let value = getArmorClass(for: player)
      return ReviewItemModel(name: combatValue.name, valueInt: value, subText: combatValue.description)
    case .meleeBonus:
      let value = getMeleeBonusString(for: player)
      return ReviewItemModel(name: combatValue.name, valueStr: value, subText: combatValue.description)
    case .maxHP:
      let value = player.pcHitPoints
      return ReviewItemModel(name: combatValue.name, valueInt: value, subText: combatValue.description)
    case .conBonusHP:
      let value = getHPBonusString(for: player)
      return ReviewItemModel(name: combatValue.name, valueStr: value, subText: combatValue.description)
    case .unarmoredAC:
      let value = getUnarmoredAC(for: player)
      return ReviewItemModel(name: combatValue.name, valueInt: value, subText: combatValue.description)
    case .dexBonusAC:
      let value = getACBonusString(for: player)
      return ReviewItemModel(name: combatValue.name, valueStr: value, subText: combatValue.description)
    case .missileAttacks:
      let value = getMissileBonusString(for: player)
      return ReviewItemModel(name: combatValue.name, valueStr: value, subText: combatValue.description)
    }
  }

  private func getACBonus(for player: PlayerCharacter) -> Int {
    var bonus = 0
    if let modifier = player.modifiers.first(where: { $0.modType == .armorClass }),
      let dexterity = player.abilityScores.first(where: { $0.statType == .dex }) {
      bonus = ModCalculator().getValue(for: modifier, using: dexterity.score)
    }
    return bonus
  }

  private func getArmorClass(for player: PlayerCharacter) -> Int {
    var armorACValue: Int
    if let armor = player.armor {
      armorACValue = armor.armorClass
    } else {
      armorACValue = 9
    }

    let shieldBonus = player.hasShield ? 1 : 0

    let dexBonus = getACBonus(for: player)

    return armorACValue - shieldBonus - dexBonus
  }

  private func getMeleeBonusString(for player: PlayerCharacter) -> String {
    var bonus = 0
    if let modifier = player.modifiers.first(where: { $0.modType == .melee }),
      let strength = player.abilityScores.first(where: { $0.statType == .str }) {
      bonus = ModCalculator().getValue(for: modifier, using: strength.score)
    }
    return ModifierViewModel().getNumericBonusString(for: bonus)
  }

  private func getHPBonusString(for player: PlayerCharacter) -> String {
    var bonus = 0
    if let modifier = player.modifiers.first(where: { $0.modType == .hitPoints }),
      let constitution = player.abilityScores.first(where: { $0.statType == .con }) {
      bonus = ModCalculator().getValue(for: modifier, using: constitution.score)
    }
    return ModifierViewModel().getNumericBonusString(for: bonus)
  }

  private func getUnarmoredAC(for player: PlayerCharacter) -> Int {
    let unarmoredAC = 9
    let bonus = getACBonus(for: player)
    return unarmoredAC - bonus
  }

  private func getACBonusString(for player: PlayerCharacter) -> String {
    let bonus = getACBonus(for: player)
    return ModifierViewModel().getNumericBonusString(for: bonus)
  }

  private func getMissileBonusString(for player: PlayerCharacter) -> String {
    var bonus = 0
    if let modifier = player.modifiers.first(where: { $0.modType == .missile }),
      let dexterity = player.abilityScores.first(where: { $0.statType == .dex }) {
      bonus = ModCalculator().getValue(for: modifier, using: dexterity.score)
    }

    if let characterClass = player.characterClass, characterClass == .halfling {
      bonus += 1
    }

    return ModifierViewModel().getNumericBonusString(for: bonus)
  }
}
