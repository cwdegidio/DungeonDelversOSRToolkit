//
//  ModCalculatorXPAdjustmentHalfling.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModCalculatorXPAdjustmentHalfling: XCTestCase {
  // MARK: - calculateXPAdjustment (Halfling)
  func test_ModCalculator_calculateXPAdjustment_shouldBeHalfling0() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 12),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 9),
      CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .halfling
    XCTAssertEqual(0, ModCalculator().calculateXPAdjustment(for: player))
  }

  func test_ModCalculator_calculateXPAdjustment_lowStr_highDex_shouldBeHalfling5() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 9),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 9),
      CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .halfling
    XCTAssertEqual(5, ModCalculator().calculateXPAdjustment(for: player))
  }

  func test_ModCalculator_calculateXPAdjustment_highStr_lowDex_shouldBeHalfling5() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 13),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 9),
      CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .halfling
    XCTAssertEqual(5, ModCalculator().calculateXPAdjustment(for: player))
  }

  func test_ModCalculator_calculateXPAdjustment_shouldBeHalfling10() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 13),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 9),
      CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .halfling
    XCTAssertEqual(10, ModCalculator().calculateXPAdjustment(for: player))
  }
}
