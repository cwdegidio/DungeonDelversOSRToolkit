//
//  SavingThrow.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import Foundation

enum SavingThrow: CaseIterable {
  case death
  case wands
  case paralysis
  case breath
  case spells

  var name: String {
    switch self {
    case .death:
      return "Death / poison"
    case .wands:
      return "Wands"
    case .paralysis:
      return "Paralysis / petrify"
    case .breath:
      return "Breath attacks"
    case .spells:
      return "Spells / rods / staves"
    }
  }
}
