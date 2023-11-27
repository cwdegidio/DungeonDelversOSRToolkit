//
//  CharacterAbilitySubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class AbilitySubReviewModel {
  func getStatContent(for ability: some Ability, using player: PlayerCharacter) -> ReviewItemModel {
    let name = ability.statType.shortName.uppercased()
    let value = ability.score
    var modifierNames: [String] = []

    for modifier in player.modifiers.filter({ $0.asscStat == ability.statType }) {
      modifierNames.append(modifier.modType.name)
    }

    let modifiersString = modifierNames.joined(separator: ", ")

    return ReviewItemModel(name: name, valueInt: value, subText: modifiersString)
  }
}
