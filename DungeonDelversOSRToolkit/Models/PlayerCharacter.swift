//
//  PlayerCharacter.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

final class PlayerCharacter: ObservableObject, Observable, Codable {
  @Published var name: String
  var alignment: Alignment?
  @Published var title: String
  var level: Int
  var modifiers: [Modifier]
  var pcHitPoints: Int
  @Published var coins: [Coinage: Int]
  @Published var characterClass: CharacterClass?
  @Published var abilityScores: [any Ability]
  @Published var additionalLanguages: [Language]
  @Published var spells: [MUSpell]
  @Published var armor: Armor?
  @Published var hasShield: Bool
  @Published var weapons: [Weapon]
  @Published var ammo: [Ammo]
  @Published var gear: [Gear]

  enum CodingKeys: CodingKey {
    case name
    case alignment
    case title
    case level
    case modifiers
    case pcHitPoints
    case coins
    case characterClass
    case abilityScores
    case additionalLanguages
    case spells
    case armor
    case hasShield
    case weapons
    case ammo
    case gear
  }

  init() {
    self.name = ""
    self.title = ""
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
    self.additionalLanguages = []
    self.spells = []
    self.armor = nil
    self.hasShield = false
    self.weapons = []
    self.ammo = []
    self.gear = []
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.coins = try container.decode([Coinage: Int].self, forKey: .coins)
    self.characterClass = try container.decode(CharacterClass.self, forKey: .characterClass)
    self.abilityScores = try container.decode([CharacterAbility].self, forKey: .abilityScores)
    self.name = try container.decode(String.self, forKey: .name)
    self.alignment = try container.decode(Alignment.self, forKey: .alignment)
    self.title = try container.decode(String.self, forKey: .title)
    self.level = try container.decode(Int.self, forKey: .level)
    self.modifiers = try container.decode([CharacterMod].self, forKey: .modifiers)
    self.pcHitPoints = try container.decode(Int.self, forKey: .pcHitPoints)
    self.additionalLanguages = try container.decode([Language].self, forKey: .additionalLanguages)
    self.spells = try container.decode([MUSpell].self, forKey: .spells)
    self.armor = try container.decode(Armor.self, forKey: .armor)
    self.hasShield = try container.decode(Bool.self, forKey: .hasShield)
    self.weapons = try container.decode([Weapon].self, forKey: .weapons)
    self.ammo = try container.decode([Ammo].self, forKey: .ammo)
    self.gear = try container.decode([Gear].self, forKey: .gear)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(coins, forKey: .coins)
    try container.encode(characterClass, forKey: .characterClass)
    //    try container.encode(abilityScores, forKey: .abilityScores)
    try container.encode(name, forKey: .name)
    try container.encode(alignment, forKey: .alignment)
    try container.encode(title, forKey: .title)
    try container.encode(level, forKey: .level)
    //    try container.encode(modifiers, forKey: .modifiers)
    try container.encode(pcHitPoints, forKey: .pcHitPoints)
    try container.encode(additionalLanguages, forKey: .additionalLanguages)
    try container.encode(spells, forKey: .spells)
    try container.encode(armor, forKey: .armor)
    try container.encode(hasShield, forKey: .hasShield)
    try container.encode(weapons, forKey: .weapons)
    try container.encode(ammo, forKey: .ammo)
    try container.encode(gear, forKey: .gear)

    var abilityScoreContainer = container.nestedUnkeyedContainer(forKey: .abilityScores)
    for abilityScore in abilityScores {
      try abilityScoreContainer.encode(abilityScore)
    }

    var modifiersContainer = container.nestedUnkeyedContainer(forKey: .modifiers)
    for modifier in modifiers {
      try modifiersContainer.encode(modifier)
    }
  }
}
