//
//  ClassAbilitySubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ClassAbilitySubReviewModelTest: XCTestCase {
  func test_ClassAbilitySubReviewModel_getClassAbilities_NonMagicUser_NonHalfling_shouldBeEqual() throws {
    let viewModel = ClassAbilitySubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .cleric

    let data = viewModel.getClassAbilities(for: player)
    XCTAssertEqual(4, data.count)
  }

  func test_ClassAbilitySubReviewModel_getClassAbilities_MagicUser_shouldBeEqual() throws {
    let viewModel = ClassAbilitySubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .magicUser

    let data = viewModel.getClassAbilities(for: player)
    XCTAssertEqual(3, data.count)
  }
}
