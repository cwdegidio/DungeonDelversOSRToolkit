//
//  PlayerCharacter.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

class PlayerCharacter: ObservableObject, Observable {
  var name: String?
  var alignment: Alignment?
  var title: String?
  var level: Int
  var modifiers: [Modifier]
  var pcHitPoints: Int
  @Published var coins: [Coinage: Int]
  @Published var characterClass: CharacterClass?
  @Published var abilityScores: [Ability]

  init() {
    self.level = 1
    self.characterClass = nil
    self.pcHitPoints = 0
    self.coins = [
      .platinumPieces: 0,
      .goldPieces: 0,
      .electrumPieces: 0,
      .silverPieces: 0,
      .copperPieces: 0
    ]
    self.abilityScores = [
      CharacterAbility(statType: .str, score: 0),
      CharacterAbility(statType: .dex, score: 0),
      CharacterAbility(statType: .con, score: 0),
      CharacterAbility(statType: .int, score: 0),
      CharacterAbility(statType: .wis, score: 0),
      CharacterAbility(statType: .cha, score: 0)
    ]
    self.modifiers = [
      CharacterMod(modType: .melee, asscStat: .str),
      CharacterMod(modType: .openDoors, asscStat: .str),
      CharacterMod(modType: .armorClass, asscStat: .dex),
      CharacterMod(modType: .missile, asscStat: .dex),
      CharacterMod(modType: .initiative, asscStat: .dex),
      CharacterMod(modType: .hitPoints, asscStat: .con),
      CharacterMod(modType: .spokenLanguage, asscStat: .int),
      CharacterMod(modType: .literacy, asscStat: .int),
      CharacterMod(modType: .magicSaves, asscStat: .wis),
      CharacterMod(modType: .npcReaction, asscStat: .cha),
      CharacterMod(modType: .retainerMax, asscStat: .cha),
      CharacterMod(modType: .retainerLoyalty, asscStat: .cha)
    ]
  }
}
