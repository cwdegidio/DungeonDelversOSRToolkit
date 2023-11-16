//
//  ModifierViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/16/23.
//

import Foundation

class ModifierViewModel {
  func getModifierString(for modifier: Modifier, player: PlayerCharacter) -> String {
    let modCalculator = ModCalculator()
    let score = player.abilityScores.first { $0.statType == modifier.asscStat }?.score
    let value = modCalculator.getValue(for: modifier, using: score ?? 0)

    switch modifier.modType {
    case .melee, .armorClass, .missile, .initiative, .hitPoints, .npcReaction, .magicSaves:
      return getNumericBonusString(for: value)
    case .openDoors:
      return getOpenDoorsString(for: value)
    case .retainerMax:
      return "\(value)"
    case .retainerLoyalty:
      return "\(value)"
    case .spokenLanguage:
      return getSpokenLanguageString(for: SpokenLanguage(rawValue: value) ?? SpokenLanguage.nativeBroken)
    case .literacy:
      return getLiteracyString(for: Literacy(rawValue: value) ?? Literacy.illiterate)
    }
  }

  //    func getXPModifierString(for value: Int) -> String {
  //        if value == 0 {
  //            return "None"
  //        }
  //
  //        return "\(value)%"
  //    }

  func getLiteracyString(for value: Literacy) -> String {
    switch value {
    case .illiterate:
      return "Illiterate"
    case .basic:
      return "Basic"
    case .literate:
      return "Literate"
    }
  }

  func getSpokenLanguageString(for value: SpokenLanguage) -> String {
    switch value {
    case .nativeBroken:
      return "Native (broken speech)"
    case .native:
      return "Native"
    case .nativePlus1:
      return "Native + 1 additional"
    case .nativePlus2:
      return "Native + 2 additional"
    case .nativePlus3:
      return "Native + 3 additional"
    }
  }

  func getOpenDoorsString(for value: Int) -> String {
    return "\(value)-in-6"
  }

  func getNumericBonusString(for value: Int) -> String {
    if value > 0 {
      return "+\(value)"
    } else if value == 0 {
      return "None"
    } else {
      return "\(value)"
    }
  }
}
