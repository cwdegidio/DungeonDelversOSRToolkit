//
//  CombatSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class CombatSubReviewModelTest: XCTestCase {
  func test_CombatSubReviewModel_getCombatData_AC_shouldBeEqual() throws {
    let viewModel = CombatSubReviewModel()

    let player = PlayerCharacter()
    player.characterClass = .fighter
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    player.armor = .chainmail
    player.hasShield = true

    let data = viewModel.getCombatData(for: .armorClass, using: player)
    XCTAssertEqual("AC", data.name)
    XCTAssertEqual("3", String(describing: data.value))
    XCTAssertEqual("Armor Class", data.subText)
  }

  func test_CombatSubReviewModel_getCombatData_ACnoArmor_shouldBeEqual() throws {
    let viewModel = CombatSubReviewModel()

    let player = PlayerCharacter()
    player.characterClass = .fighter
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]

    let data = viewModel.getCombatData(for: .armorClass, using: player)
    XCTAssertEqual("AC", data.name)
    XCTAssertEqual("8", String(describing: data.value))
    XCTAssertEqual("Armor Class", data.subText)
  }

  func test_CombatSubReviewModel_getCombatData_MeleeBonus_shouldBeEqual() throws {
    let viewModel = CombatSubReviewModel()

    let player = PlayerCharacter()
    player.characterClass = .fighter
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]

    let data = viewModel.getCombatData(for: .meleeBonus, using: player)
    XCTAssertEqual("Mel", data.name)
    XCTAssertEqual("+2", String(describing: data.value))
    XCTAssertEqual("STR modifier to melee attack / damage", data.subText)
  }

  func test_CombatSubReviewModel_getCombatData_maxHP_shouldBeEqual() throws {
    let viewModel = CombatSubReviewModel()

    let player = PlayerCharacter()
    player.pcHitPoints = 8

    let data = viewModel.getCombatData(for: .maxHP, using: player)
    XCTAssertEqual("Max", data.name)
    XCTAssertEqual("8", String(describing: data.value))
    XCTAssertEqual("Maximum hit points", data.subText)
  }

  func test_CombatSubReviewModel_getCombatData_HPBonus_shouldBeEqual() throws {
    let viewModel = CombatSubReviewModel()

    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 10),
      CharacterAbility(statType: .con, score: 15),
      CharacterAbility(statType: .int, score: 9),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]

    let data = viewModel.getCombatData(for: .conBonusHP, using: player)
    XCTAssertEqual("±", data.name)
    XCTAssertEqual("+1", String(describing: data.value))
    XCTAssertEqual("CON modifier to hit points", data.subText)
  }

  func test_CombatSubReviewModel_getCombatData_unArmoredAC_shouldBeEqual() throws {
    let viewModel = CombatSubReviewModel()

    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 15),
      CharacterAbility(statType: .int, score: 9),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]

    let data = viewModel.getCombatData(for: .unarmoredAC, using: player)
    XCTAssertEqual("Un", data.name)
    XCTAssertEqual("9", String(describing: data.value))
    XCTAssertEqual("Unarmored AC: 9 + DEX Modifier", data.subText)
  }

  func test_CombatSubReviewModel_getCombatData_ACBonusString_shouldBeEqual() throws {
    let viewModel = CombatSubReviewModel()

    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 18),
      CharacterAbility(statType: .con, score: 15),
      CharacterAbility(statType: .int, score: 9),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]

    let data = viewModel.getCombatData(for: .dexBonusAC, using: player)
    XCTAssertEqual("±", data.name)
    XCTAssertEqual("+3", String(describing: data.value))
    XCTAssertEqual("DEX modifier to Armor Class", data.subText)
  }

  func test_CombatSubReviewModel_getCombatData_MissileBonusString_shouldBeEqual() throws {
    let viewModel = CombatSubReviewModel()

    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 15),
      CharacterAbility(statType: .int, score: 9),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]

    let data = viewModel.getCombatData(for: .missileAttacks, using: player)
    XCTAssertEqual("Mis", data.name)
    XCTAssertEqual("-1", String(describing: data.value))
    XCTAssertEqual("DEX modifier to missile attacks", data.subText)
  }

  func test_CombatSubReviewModel_getCombatData_MissileBonusStringAsHalfling_shouldBeEqual() throws {
    let viewModel = CombatSubReviewModel()

    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 15),
      CharacterAbility(statType: .int, score: 9),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    player.characterClass = .halfling

    let data = viewModel.getCombatData(for: .missileAttacks, using: player)
    XCTAssertEqual("Mis", data.name)
    XCTAssertEqual("None", String(describing: data.value))
    XCTAssertEqual("DEX modifier to missile attacks", data.subText)
  }
}
