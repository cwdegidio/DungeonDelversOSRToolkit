//
//  PlayerCharacterModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class PlayerCharacterModelTest: XCTestCase {
  func test_PlayerCharacterModel_encode_shouldBeEqual() throws {
    let player = PlayerCharacter()
    // swiftlint:disable force_unwrapping
    // disabled for testing
    player.id = UUID(uuidString: "0D138735-2807-4927-A5A6-A21A4C3CBE26")!
    // swiftlint:enable force_unwrapping
    player.name = "Kilgore"
    player.alignment = .law
    player.title = "Baron"
    player.pcHitPoints = 8
    player.characterClass = .cleric
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 10),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 13),
      CharacterAbility(statType: .wis, score: 18),
      CharacterAbility(statType: .cha, score: 12)
    ]
    player.additionalLanguages = [.goblin]
    player.armor = .chainmail
    player.hasShield = true
    player.weapons = [.mace]
    player.ammo = []
    player.gear = [.backpack, .torches, .tinderBox, .rope]
    player.coins = [
      .platinumPieces: 0,
      .goldPieces: 15,
      .electrumPieces: 0,
      .silverPieces: 0,
      .copperPieces: 0
    ]

    let data = try JSONEncoder().encode(player)
    let decodedData = try JSONDecoder().decode(PlayerCharacter.self, from: data)
    XCTAssertEqual(player.id, decodedData.id)
    XCTAssertEqual(player.name, decodedData.name)
    XCTAssertEqual(player.alignment, decodedData.alignment)
    XCTAssertEqual(player.title, decodedData.title)
    XCTAssertEqual(player.pcHitPoints, decodedData.pcHitPoints)
    XCTAssertEqual(player.characterClass, decodedData.characterClass)
    XCTAssertEqual(player.additionalLanguages, decodedData.additionalLanguages)
    XCTAssertEqual(player.armor, decodedData.armor)
    XCTAssertEqual(player.hasShield, decodedData.hasShield)
    XCTAssertEqual(player.weapons, decodedData.weapons)
    XCTAssertEqual(player.ammo, decodedData.ammo)
    XCTAssertEqual(player.gear, decodedData.gear)
    XCTAssertEqual(player.coins, decodedData.coins)
  }
}
