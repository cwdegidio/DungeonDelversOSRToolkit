//
//  AdvancementSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class AdvancementSubReviewModel {
  func getNextLevelXP(for player: PlayerCharacter) -> ReviewItemModel {
    var nextLevel = 0
    if let characterClass = player.characterClass {
      nextLevel = characterClass.xpForLevel2
    }
    let value = Int(nextLevel).formatted()

    return ReviewItemModel(name: "Next", valueStr: value, subText: "Experience points for next level")
  }

  func getXPBonus(for player: PlayerCharacter) -> ReviewItemModel {
    let bonus = "\(ModCalculator().calculateXPAdjustment(for: player))%"

    return ReviewItemModel(name: "%", valueStr: bonus, subText: "Prime requisite modifier to XP")
  }
}
