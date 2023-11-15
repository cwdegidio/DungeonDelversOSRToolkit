//
//  CharacterAbility.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

class CharacterAbility: Ability {
  var statType: Stat
  var score: Int

  init(statType: Stat, score: Int) {
    self.statType = statType
    self.score = score
  }
}
