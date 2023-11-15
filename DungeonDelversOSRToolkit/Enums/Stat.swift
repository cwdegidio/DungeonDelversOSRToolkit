//
//  Stat.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

enum Stat {
  case str
  case dex
  case con
  case int
  case wis
  case cha

  var name: String {
    switch self {
    case .str:
      return "Strength"
    case .dex:
      return "Dexterity"
    case .con:
      return "Constitution"
    case .int:
      return "Intelligence"
    case .wis:
      return "Wisdom"
    case .cha:
      return "Charisma"
    }
  }

  var shortName: String {
    switch self {
    case .str:
      return "Str"
    case .dex:
      return "Dex"
    case .con:
      return "Con"
    case .int:
      return "Int"
    case .wis:
      return "Wis"
    case .cha:
      return "Cha"
    }
  }

  var description: String {
    switch self {
    case .str:
      return "Brawn, muscle, and physical power."
    case .dex:
      return "Agility, reflexes, speed, and balance."
    case .con:
      return "Health, stamina, and endurance."
    case .int:
      return "Learning, memory, and reasoning."
    case .wis:
      return "Willpower, common sense, perception, and intuition."
    case .cha:
      return "Force of personality, persuasiveness, personal magnetism, physical attractiveness, and ability to lead."
    }
  }
}
