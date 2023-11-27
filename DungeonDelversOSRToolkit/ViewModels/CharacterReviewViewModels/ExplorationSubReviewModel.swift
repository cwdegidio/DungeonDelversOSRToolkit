//
//  ExplorationSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class ExplorationSubReviewModel {
  func getListenAtDoor(for player: PlayerCharacter) -> ReviewItemModel {
    var bonus = 1
    if let characterClass = player.characterClass {
      let variantClass: [CharacterClass] = [.dwarf, .elf, .halfling, .thief]
      if variantClass.contains(characterClass) {
        bonus = 2
      }
    }

    let listenDoorString = "\(bonus)-in-6"
    return ReviewItemModel(name: "LD", valueStr: listenDoorString, subText: "Listen at door (1-in-6 or by class)")
  }

  func getOpenDoor(for player: PlayerCharacter) -> ReviewItemModel {
    var bonus = 0
    if let modifier = player.modifiers.first(where: { $0.modType == .openDoors }),
      let strength = player.abilityScores.first(where: { $0.statType == .str }) {
      bonus = ModCalculator().getValue(for: modifier, using: strength.score)
    }

    let openDoorsString = ModifierViewModel().getOpenDoorsString(for: bonus)
    return ReviewItemModel(name: "OD", valueStr: openDoorsString, subText: "Open stuck door (based on STR)")
  }

  func getSecretDoor(for player: PlayerCharacter) -> ReviewItemModel {
    var bonus = 1
    if let characterClass = player.characterClass {
      if characterClass == .elf {
        bonus = 2
      }
    }

    let secretDoorString = "\(bonus)-in-6"
    return ReviewItemModel(name: "SD", valueStr: secretDoorString, subText: "Find secret door (1-in-6 or by class)")
  }

  func getFindRoomTrap(for player: PlayerCharacter) -> ReviewItemModel {
    var bonus = 1
    if let characterClass = player.characterClass {
      if characterClass == .dwarf {
        bonus = 2
      }
    }

    let findRoomTrapString = "\(bonus)-in-6"
    return ReviewItemModel(name: "FT", valueStr: findRoomTrapString, subText: "Find room trap (1-in-6 or by class)")
  }
}
