//
//  Language.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

enum Language: String, CaseIterable, Codable {
  case alignment
  case bugbear
  case doppelganger
  case common
  case dragon
  case dwarvish
  case elvish
  case gargoyle
  case gnoll
  case gnomish
  case goblin
  case halfling
  case harpy
  case hobgoblin
  case kobold
  case lizardMan
  case medussa
  case minotaur
  case ogre
  case orcish
  case pixie
  case humanDialect

  var name: String {
    switch self {
    case .alignment:
      return "Alignment"
    case .bugbear:
      return "Bugbear"
    case .doppelganger:
      return "Doppelgänger"
    case .common:
      return "Common"
    case .dragon:
      return "Dragon"
    case .dwarvish:
      return "Dwarvish"
    case .elvish:
      return "Elvish"
    case .gargoyle:
      return "Gargoyle"
    case .gnoll:
      return "Gnoll"
    case .gnomish:
      return "Gnomish"
    case .goblin:
      return "Goblin"
    case .halfling:
      return "Halfling"
    case .harpy:
      return "Harpy"
    case .hobgoblin:
      return "Hobgoblin"
    case .kobold:
      return "Kobold"
    case .lizardMan:
      return "Lizard Man"
    case .medussa:
      return "Medussa"
    case .minotaur:
      return "Minotaur"
    case .ogre:
      return "Ogre"
    case .orcish:
      return "Orcish"
    case .pixie:
      return "Pixie"
    case .humanDialect:
      return "Human dialect"
    }
  }
}
