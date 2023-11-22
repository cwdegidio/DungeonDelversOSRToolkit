//
//  AbilityViewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class AbilityViewModelTest: XCTestCase {
  func test_AbilityViewModel_setSingleAbilityScore_shouldBeGTE3andLTE18() throws {
    let viewModel = AbilityViewModel()
    let player = PlayerCharacter()
    viewModel.setSingleAbilityScore(for: player, onAbility: .str)
    XCTAssertLessThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .str).1, 18)
    XCTAssertGreaterThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .str).1, 3)
  }

  func test_AbilityViewModel_setAllAbilityScores_shouldAllBeGTE3andLTE18() {
    let viewModel = AbilityViewModel()
    let player = PlayerCharacter()
    viewModel.setAllAbilityScores(for: player)
    XCTAssertLessThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .str).1, 18)
    XCTAssertGreaterThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .str).1, 3)
    XCTAssertLessThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .dex).1, 18)
    XCTAssertGreaterThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .dex).1, 3)
    XCTAssertLessThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .con).1, 18)
    XCTAssertGreaterThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .con).1, 3)
    XCTAssertLessThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .int).1, 18)
    XCTAssertGreaterThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .int).1, 3)
    XCTAssertLessThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .wis).1, 18)
    XCTAssertGreaterThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .wis).1, 3)
    XCTAssertLessThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .cha).1, 18)
    XCTAssertGreaterThanOrEqual(viewModel.getAbilityScoreAndName(for: player, with: .cha).1, 3)
  }

  func test_AbilityViewModel_getAbilityScoreAndName_shouldBeStatShortNameAndIntGTE3andLTE18() {
    let viewModel = AbilityViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 6),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertEqual("Str", viewModel.getAbilityScoreAndName(for: player, with: .str).0)
    XCTAssertEqual(18, viewModel.getAbilityScoreAndName(for: player, with: .str).1)
  }
}
