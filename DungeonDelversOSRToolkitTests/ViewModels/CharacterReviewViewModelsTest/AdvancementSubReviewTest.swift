//
//  AdvancementSubReviewTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class AdvancementSubReviewTest: XCTestCase {
  func test_AdvancementSubReview_getNextLevelXP_shouldBeEqual() throws {
    let viewModel = AdvancementSubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .fighter

    let data = viewModel.getNextLevelXP(for: player)

    XCTAssertEqual("Next", data.name)
    XCTAssertEqual("2,000", String(describing: data.value))
    XCTAssertEqual("Experience points for next level", data.subText)
  }

  func test_AdvancementSubReview_getXPBonus_shouldBeEqual() throws {
    let viewModel = AdvancementSubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .fighter
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 15),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]

    let data = viewModel.getXPBonus(for: player)

    XCTAssertEqual("%", data.name)
    XCTAssertEqual("5%", String(describing: data.value))
    XCTAssertEqual("Prime requisite modifier to XP", data.subText)
  }
}
