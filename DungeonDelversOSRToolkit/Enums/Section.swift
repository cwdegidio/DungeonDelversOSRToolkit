//
//  Section.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

// TODO: Remove?
enum Section {
  case abilities
  case classSelection
  case abilityAdjustment

  var name: String {
    switch self {
    case .abilities:
      return "I. Generate Abilities"
    case .classSelection:
      return "II. Choose Class"
    case .abilityAdjustment:
      return "III. Ability Adjustment"
    }
  }
}
