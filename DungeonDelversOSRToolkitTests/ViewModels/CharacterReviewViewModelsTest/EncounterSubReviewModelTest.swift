//
//  EncounterSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class EncounterSubReviewModelTest: XCTestCase {
  func test_EncounterSubReviewModel_getInitModifier_shouldBeEqual() throws {
    let viewModel = EncounterSubReviewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    player.characterClass = .cleric

    let data = viewModel.getInitModifier(for: player)
    XCTAssertEqual("Init", data.name)
    XCTAssertEqual("+1", String(describing: data.value))
    XCTAssertEqual("DEX modifier to initiative", data.subText)
  }

  func test_EncounterSubReviewModel_getInitModifier_asHalfling_shouldBeEqual() throws {
    let viewModel = EncounterSubReviewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    player.characterClass = .halfling

    let data = viewModel.getInitModifier(for: player)
    XCTAssertEqual("Init", data.name)
    XCTAssertEqual("+2", String(describing: data.value))
    XCTAssertEqual("DEX modifier to initiative", data.subText)
  }

  func test_EncounterSubReviewModel_getReactionModifier_shouldBeEqual() throws {
    let viewModel = EncounterSubReviewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    player.characterClass = .halfling

    let data = viewModel.getReactionBonus(for: player)
    XCTAssertEqual("±", data.name)
    XCTAssertEqual("None", String(describing: data.value))
    XCTAssertEqual("CHA modifier to reaction rolls", data.subText)
  }
}
