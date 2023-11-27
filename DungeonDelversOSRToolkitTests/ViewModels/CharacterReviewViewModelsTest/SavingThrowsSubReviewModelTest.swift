//
//  SavingThrowsSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/26/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class SavingThrowsSubReviewModelTest: XCTestCase {
  func test_SavingThrowsSubReviewModel_getSavingThrowContent_withCharacterClass_shouldBeEqual() throws {
    let viewModel = SavingThrowsSubReviewModel()

    let player = PlayerCharacter()
    player.characterClass = .fighter

    let data = viewModel.getSavingThrowContent(for: .breath, using: player)
    XCTAssertEqual("B", data.name)
    XCTAssertEqual("15", String(describing: data.value))
    XCTAssertEqual("Breath attacks", data.subText)
  }

  func test_SavingThrowsSubReviewModel_getSavingThrowContent_withNoCharacterClass_shouldBeEqual() throws {
    let viewModel = SavingThrowsSubReviewModel()

    let player = PlayerCharacter()
    player.characterClass = nil

    let data = viewModel.getSavingThrowContent(for: .breath, using: player)
    XCTAssertEqual("B", data.name)
    XCTAssertEqual("0", String(describing: data.value))
    XCTAssertEqual("Breath attacks", data.subText)
  }

  func test_SavingThrowsSubReviewModel_getMagicSaveBonus_shouldBeEqual() throws {
    let viewModel = SavingThrowsSubReviewModel()

    let player = PlayerCharacter()
    player.characterClass = .fighter
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]

    let data = viewModel.getMagicSaveBonus(for: player)
    XCTAssertEqual("±", data.name)
    XCTAssertEqual("None", String(describing: data.value))
    XCTAssertEqual("WIS modifier to saves vs magic", data.subText)
  }
}
