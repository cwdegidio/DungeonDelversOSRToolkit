//
//  ClassAbilitySubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class ClassAbilitySubReviewModel {
  func getClassAbilities(for player: PlayerCharacter) -> [String] {
    var abilities: [String] = []
    if let characterClass = player.characterClass {
      var primeReqString = "**Prime Requisite:** "
      primeReqString += characterClass.classFeatures[0].value
      abilities.append(primeReqString)

      var combatString = "**Combat:** "
      combatString += characterClass.classFeatures[1].value
      abilities.append(combatString)

      var otherAbilities: [String] = []
      if characterClass != .halfling && characterClass != .magicUser {
        for i in 2..<characterClass.classFeatures.endIndex - 1 {
          otherAbilities.append(characterClass.classFeatures[i].key)
        }
      } else {
        for i in 2..<characterClass.classFeatures.endIndex {
          otherAbilities.append(characterClass.classFeatures[i].key)
        }
      }

      let otherAbilitiesString = otherAbilities.joined(separator: ", ")
      abilities.append(otherAbilitiesString)

      if characterClass != .magicUser && characterClass != .halfling {
        var level9String = "**After Reaching 9th Level:** "
        let lastIndex = characterClass.classFeatures.endIndex - 1
        level9String += characterClass.classFeatures[lastIndex].value
        abilities.append(level9String)
      }
    }

    return abilities
  }
}
