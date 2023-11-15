//
//  Mod.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

enum Mod {
  case melee
  case openDoors
  case armorClass
  case missile
  case initiative
  case hitPoints
  case npcReaction
  case retainerMax
  case retainerLoyalty
  case spokenLanguage
  case literacy
  case magicSaves

  var name: String {
    switch self {
    case .melee:
      return "Melee"
    case .openDoors:
      return "Open Doors"
    case .armorClass:
      return "AC"
    case .missile:
      return "Missile"
    case .initiative:
      return "Initiative"
    case .hitPoints:
      return "HP"
    case .npcReaction:
      return "NPC Reactions"
    case .retainerMax:
      return "Retainers Max #"
    case .retainerLoyalty:
      return "Retainers Loyalty"
    case .spokenLanguage:
      return "Spoken Languages"
    case .literacy:
      return "Literacy"
    case .magicSaves:
      return "Magic Saves"
    }
  }

  var description: String {
    switch self {
    case .melee:
      return "Is applied to attack and damage rolls with melee weapons."
    case .openDoors:
      return "The chance of success with attempts to force open a stuck door"
    case .armorClass:
      return "Modifies the character’s AC (a bonus lowers AC, a penalty raises it)."
    case .missile:
      return "Applied to attack rolls (but not damage rolls) with ranged weapons."
    case .initiative:
      return "Modifies the character’s initiative roll."
    case .hitPoints:
      return "Applies when rolling a character’s hit points."
    case .npcReaction:
      return "Applies when hiring retainers and when interacting with monsters."
    case .retainerMax:
      return "Determines the number of retainers a character may have at any one time."
    case .retainerLoyalty:
      return "Determines retainers’ loyalty to the character."
    case .spokenLanguage:
      return "Denotes the number of languages the character can speak."
    case .literacy:
      return "Indicates the character’s ability to read and write their native languages."
    case .magicSaves:
      return "Is applied to saving throws versus magical effects."
    }
  }
}
