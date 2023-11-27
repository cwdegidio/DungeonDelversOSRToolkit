//
//  AbilitySubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/26/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class AbilitySubReviewModelTest: XCTestCase {
  func test_AbilitySubReviewModel_getStatContent_shouldBeTrue() throws {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let viewModel = AbilitySubReviewModel()
    let data = viewModel.getStatContent(for: player.abilityScores[0], using: player)
    XCTAssertEqual("STR", data.name)
    XCTAssertEqual("17", String(describing: data.value))
    XCTAssertEqual("Melee, Open Doors", data.subText)
  }
}
