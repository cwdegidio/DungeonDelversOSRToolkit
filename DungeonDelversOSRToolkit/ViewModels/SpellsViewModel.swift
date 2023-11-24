//
//  SpellsViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import Foundation

class SpellsViewModel {
  func updatePlayerSpells(for player: PlayerCharacter, with spell: MUSpell) {
    if !player.spells.isEmpty {
      player.spells.removeFirst()
    }
    player.spells.append(spell)
  }
}
