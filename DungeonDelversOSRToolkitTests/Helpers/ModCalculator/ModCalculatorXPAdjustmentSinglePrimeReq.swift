//
//  ModCalculatorXPAdjustmentSinglePrimeReq.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModCalculatorXPAdjustmentSinglePrimeReq: XCTestCase {
  // MARK: - calculateXPAdjustment (Single Prime Req)
  func test_ModCalculator_calculateXPAdjustment_shouldBeSingleReqMinus20() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .wis, score: 3),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .cleric
    XCTAssertEqual(-20, ModCalculator().calculateXPAdjustment(for: player))
  }

  func test_ModCalculator_calculateXPAdjustment_shouldBeSingleReqMinus10() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 7),
      CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .fighter
    XCTAssertEqual(-10, ModCalculator().calculateXPAdjustment(for: player))
  }

  func test_ModCalculator_calculateXPAdjustment_shouldBeSingleReq0() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .int, score: 10),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .magicUser
    XCTAssertEqual(0, ModCalculator().calculateXPAdjustment(for: player))
  }

  func test_ModCalculator_calculateXPAdjustment_shouldBeSingleReq5() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 14),
      CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .dwarf
    XCTAssertEqual(5, ModCalculator().calculateXPAdjustment(for: player))
  }

  func test_ModCalculator_calculateXPAdjustment_shouldBeSingleReq10() {
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .dex, score: 17),
      CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
      CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
    ]
    player.characterClass = .thief
    XCTAssertEqual(10, ModCalculator().calculateXPAdjustment(for: player))
  }
}
