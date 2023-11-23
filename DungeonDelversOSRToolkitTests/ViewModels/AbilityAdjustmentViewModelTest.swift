//
//  AbilityAdjustmentViewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class AbilityAdjustmentViewModelTest: XCTestCase {
  func test_AbilityAdjustmentViewModel_getPrimeRequisite_SinglePrimeReq_shouldBeTrue() throws {
    let characterClassViewModel = CharacterClassSelectionViewModel()
    let abilityAdjViewModel = AbilityAdjustmentViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 8),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    characterClassViewModel.setCharacterClass(as: .fighter, for: player)
    XCTAssertEqual("Strength", abilityAdjViewModel.getPrimeRequitsiteString(using: player))
  }

  func test_AbilityAdjustmentViewModel_getPrimeRequisite_DoublePrimeReq_shouldBeTrue() throws {
    let characterClassViewModel = CharacterClassSelectionViewModel()
    let abilityAdjViewModel = AbilityAdjustmentViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    characterClassViewModel.setCharacterClass(as: .elf, for: player)
    //    let currentCharacterClass = player.characterClass
    XCTAssertEqual("Intelligence, Strength", abilityAdjViewModel.getPrimeRequitsiteString(using: player))
  }

  func test_AbilityAdjustmentViewModel_getMaxScore_shouldBeTrue() throws {
    let viewModel = AbilityAdjustmentViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertEqual(10, viewModel.getMaxScore(for: .wis, using: player))
  }

  func test_AbilityAdjustmentViewModel_getMinScore_nonPrimeReq_shouldBeTrue() throws {
    let viewModel = AbilityAdjustmentViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertEqual(9, viewModel.getMinScore(for: .wis, isPrimeReq: false, using: player))
  }

  func test_AbilityAdjustmentViewModel_getMinScore_PrimeReq_shouldBeTrue() throws {
    let viewModel = AbilityAdjustmentViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertEqual(18, viewModel.getMinScore(for: .str, isPrimeReq: true, using: player))
  }

  func test_AbilityAdjustmentViewModel_getIsPrimeReq_shouldBeTrue() {
    let characterClassViewModel = CharacterClassSelectionViewModel()
    let abilityAdjViewModel = AbilityAdjustmentViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    characterClassViewModel.setCharacterClass(as: .fighter, for: player)
    XCTAssertTrue(abilityAdjViewModel.getIsPrimeReq(for: .str, using: player))
  }

  func test_AbilityAdjustmentViewModel_getIsPrimeReq_shouldBeFalse() {
    let characterClassViewModel = CharacterClassSelectionViewModel()
    let abilityAdjViewModel = AbilityAdjustmentViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    characterClassViewModel.setCharacterClass(as: .fighter, for: player)
    XCTAssertFalse(abilityAdjViewModel.getIsPrimeReq(for: .wis, using: player))
  }

  func test_AbilityAdjustmentViewModel_isStatAdjustable_NonPrimeReq_shouldBeTrue() {
    let characterClassViewModel = CharacterClassSelectionViewModel()
    let abilityAdjViewModel = AbilityAdjustmentViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    characterClassViewModel.setCharacterClass(as: .fighter, for: player)
    XCTAssertTrue(abilityAdjViewModel.isStatAdjustable(for: .wis, using: player))
  }

  func test_AbilityAdjustmentViewModel_isStatAdjustable_isPrimeReq_shouldBeTrue() {
    let characterClassViewModel = CharacterClassSelectionViewModel()
    let abilityAdjViewModel = AbilityAdjustmentViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    characterClassViewModel.setCharacterClass(as: .thief, for: player)
    XCTAssertTrue(abilityAdjViewModel.isStatAdjustable(for: .dex, using: player))
  }

  func test_AbilityAdjustmentViewModel_isStatAdjustable_nonPrimeReq_shouldBeFalse() {
    let characterClassViewModel = CharacterClassSelectionViewModel()
    let abilityAdjViewModel = AbilityAdjustmentViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    characterClassViewModel.setCharacterClass(as: .thief, for: player)
    XCTAssertFalse(abilityAdjViewModel.isStatAdjustable(for: .cha, using: player))
  }
}
