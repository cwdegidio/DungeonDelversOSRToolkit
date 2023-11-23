//
//  CharacterBioViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import Foundation

class CharacterBioViewModel {
  func getNumberOfLanguages(for player: PlayerCharacter) -> Int {
    guard let intStat = player.abilityScores.first(where: { $0.statType == .int }) else {
      print("[ ERROR ] Ability not available")
      return 0
    }

    guard let modifier = player.modifiers.first(where: { $0.modType == Mod.spokenLanguage }) else {
      print("[ ERROR ] No modifier available")
      return 0
    }

    return ModCalculator().getValue(for: modifier, using: intStat.score) - 2
  }

  func generateLanguageList(for player: PlayerCharacter) -> [Language] {
    guard let characterClass = player.characterClass else {
      print("No character class selected")
      return []
    }

    return Language.allCases.filter { language in
      !characterClass.languages.contains(language)
    }
  }

  func updatePlayerLanguages(using language: Language, for player: PlayerCharacter, withLimit limit: Int) {
    if !player.additionalLanguages.contains(language) && player.additionalLanguages.count < limit {
      player.additionalLanguages.append(language)
    } else {
      player.additionalLanguages.removeAll { $0 == language }
    }
  }

  func generateSelectedLanguagesString(for player: PlayerCharacter) -> String {
    if !player.additionalLanguages.isEmpty {
      var text = player.additionalLanguages.first?.name ?? ""
      if player.additionalLanguages.count > 1 {
        for i in 1..<player.additionalLanguages.count {
          text += ", \(player.additionalLanguages[i].name)"
        }
      }
      return text
    }
    return "None"
  }

  func setValueonPlayer(onfield field: inout String, withText enteredText: String) {
    field = enteredText
  }
}
