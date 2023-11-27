//
//  CombatValue.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import Foundation

enum CombatValue: CaseIterable {
  case armorClass
  case meleeBonus
  case maxHP
  case conBonusHP
  case unarmoredAC
  case dexBonusAC
  case missileAttacks

  var name: String {
    switch self {
    case .armorClass:
      return "AC"
    case .meleeBonus:
      return "Mel"
    case .maxHP:
      return "Max"
    case .conBonusHP, .dexBonusAC:
      return "±"
    case .unarmoredAC:
      return "Un"
    case .missileAttacks:
      return "Mis"
    }
  }

  var description: String {
    switch self {
    case .armorClass:
      return "Armor Class"
    case .meleeBonus:
      return "STR modifier to melee attack / damage"
    case .maxHP:
      return "Maximum hit points"
    case .conBonusHP:
      return "CON modifier to hit points"
    case .unarmoredAC:
      return "Unarmored AC: 9 + DEX Modifier"
    case .dexBonusAC:
      return "DEX modifier to Armor Class"
    case .missileAttacks:
      return "DEX modifier to missile attacks"
    }
  }
}
