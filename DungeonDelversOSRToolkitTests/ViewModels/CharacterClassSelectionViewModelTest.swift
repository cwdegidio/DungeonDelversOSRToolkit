//
//  CharacterClassSelectionViewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class CharacterClassSelectionViewModelTest: XCTestCase {
  func test_CharacterClassSelectionViewModel_meetsClassRequirements_shouldBeFighterTrue() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 6),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertTrue(viewModel.meetsClassRequirement(for: .fighter, using: player))
  }

  func test_CharacterClassSelectionViewModel_meetsClassRequirements_shouldBeClericTrue() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 6),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertTrue(viewModel.meetsClassRequirement(for: .cleric, using: player))
  }

  func test_CharacterClassSelectionViewModel_meetsClassRequirements_shouldBeMagicUserTrue() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 6),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertTrue(viewModel.meetsClassRequirement(for: .magicUser, using: player))
  }

  func test_CharacterClassSelectionViewModel_meetsClassRequirements_shouldBeThiefTrue() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 6),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertTrue(viewModel.meetsClassRequirement(for: .thief, using: player))
  }

  func test_CharacterClassSelectionViewModel_meetsClassRequirements_shouldBeElfTrue() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 9),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertTrue(viewModel.meetsClassRequirement(for: .elf, using: player))
  }

  func test_CharacterClassSelectionViewModel_meetsClassRequirements_shouldBeElfFalse() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 8),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertFalse(viewModel.meetsClassRequirement(for: .elf, using: player))
  }

  func test_CharacterClassSelectionViewModel_meetsClassRequirements_shouldBeDwarfTrue() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 9),
      CharacterAbility(statType: .int, score: 9),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertTrue(viewModel.meetsClassRequirement(for: .dwarf, using: player))
  }

  func test_CharacterClassSelectionViewModel_meetsClassRequirements_shouldBeDwarfFalse() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 8),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertFalse(viewModel.meetsClassRequirement(for: .dwarf, using: player))
  }

  func test_CharacterClassSelectionViewModel_meetsClassRequirements_shouldBeHalflingTrue() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 9),
      CharacterAbility(statType: .int, score: 9),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertTrue(viewModel.meetsClassRequirement(for: .halfling, using: player))
  }

  func test_CharacterClassSelectionViewModel_meetsClassRequirements_shouldBeHalflingFalse() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 8),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    XCTAssertFalse(viewModel.meetsClassRequirement(for: .halfling, using: player))
  }

  func test_CharacterClassSelectionViewModel_setCharacterClass_shouldBeTrue() {
    let viewModel = CharacterClassSelectionViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 8),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    viewModel.setCharacterClass(as: .fighter, for: player)
    let currentCharacterClass = player.characterClass
    XCTAssertEqual(CharacterClass.fighter, currentCharacterClass)
  }
}
