//
//  ModCalculatorXPAdjustmentElf.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModCalculatorXPAdjustmentElf: XCTestCase {
  // MARK: - calculateXPAdjustment (Elf)
  func test_ModCalculator_calculateXPAdjustment_shouldBeElf0() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 12),
      CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .int, score: 9),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .elf
    XCTAssertEqual(0, ModCalculator().calculateXPAdjustment(for: player))
  }

  func test_ModCalculator_calculateXPAdjustment_shouldBeElf5() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 13),
      CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .int, score: 13),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .elf
    XCTAssertEqual(5, ModCalculator().calculateXPAdjustment(for: player))
  }

  func test_ModCalculator_calculateXPAdjustment_shouldBeElf10() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 13),
      CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .int, score: 16),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .elf
    XCTAssertEqual(10, ModCalculator().calculateXPAdjustment(for: player))
  }
}
