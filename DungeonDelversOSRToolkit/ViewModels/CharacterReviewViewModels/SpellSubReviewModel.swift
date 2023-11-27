//
//  SpellSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class SpellSubReviewModel {
  func getMagicUserSpells(for player: PlayerCharacter) -> [String] {
    let spells = player.spells.map { $0.name }
    return spells
  }
}
