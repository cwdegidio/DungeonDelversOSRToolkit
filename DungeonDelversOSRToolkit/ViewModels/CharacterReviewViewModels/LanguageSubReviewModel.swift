//
//  LanguageSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class LanguageSubReviewModel {
  func getLanguages(for player: PlayerCharacter) -> String {
    var languages: [Language] = []
    if let characterClass = player.characterClass {
      languages += characterClass.languages
    }

    languages += player.additionalLanguages
    let languagesAsStr = languages.map { $0.name }

    return languagesAsStr.sorted().joined(separator: ", ")
  }

  func getLiteracy(for player: PlayerCharacter) -> String {
    var bonus = 0
    if let modifier = player.modifiers.first(where: { $0.modType == .literacy }),
      let intelligence = player.abilityScores.first(where: { $0.statType == .int }) {
      bonus = ModCalculator().getValue(for: modifier, using: intelligence.score)
    }

    switch bonus {
    case 1:
      return "Illiterate"
    case 2:
      return "Basic"
    case 3:
      return "Literate"
    default:
      return "Illiterate"
    }
  }
}
