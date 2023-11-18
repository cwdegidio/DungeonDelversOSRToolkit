//
//  CharacterClassSelectionViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/17/23.
//

import Foundation

class CharacterClassSelectionViewModel {
  func meetsClassRequirement(for characterClass: CharacterClass, using player: PlayerCharacter) -> Bool {
    let requirements = characterClass.requirements
    if requirements == nil {
      // Cleric, Fighter, Magic-User, and Thief have no reqs
      return true
    }

    if let reqs = requirements {
      for req in reqs {
        let score = player.abilityScores.first { $0.statType == req.0 }?.score ?? 0
        // Check if we can be a Demihuman
        if  score >= req.1 {
          continue
        } else {
          return false
        }
      }
    }

    return true
  }

  func setCharacterClass(as characterClass: CharacterClass, for player: PlayerCharacter) {
    player.characterClass = characterClass
  }
}
