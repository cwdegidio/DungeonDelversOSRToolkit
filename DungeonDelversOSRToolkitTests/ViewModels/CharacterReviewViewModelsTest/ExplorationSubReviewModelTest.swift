//
//  ExplorationSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ExplorationSubReviewModelTest: XCTestCase {
  func test_ExplorationSubReviewModel_getListenAtDoor_shouldBeEqual() throws {
    let viewModel = ExplorationSubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .fighter
    let data = viewModel.getListenAtDoor(for: player)
    XCTAssertEqual("LD", data.name)
    XCTAssertEqual("1-in-6", String(describing: data.value))
    XCTAssertEqual("Listen at door (1-in-6 or by class)", data.subText)
  }

  func test_ExplorationSubReviewModel_getListenAtDoor_asVariant_shouldBeEqual() throws {
    let viewModel = ExplorationSubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .dwarf
    let data = viewModel.getListenAtDoor(for: player)
    XCTAssertEqual("LD", data.name)
    XCTAssertEqual("2-in-6", String(describing: data.value))
    XCTAssertEqual("Listen at door (1-in-6 or by class)", data.subText)
  }

  func test_ExplorationSubReviewModel_getOpenDoor_shouldBeEqual() throws {
    let viewModel = ExplorationSubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .dwarf
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let data = viewModel.getOpenDoor(for: player)
    XCTAssertEqual("OD", data.name)
    XCTAssertEqual("4-in-6", String(describing: data.value))
    XCTAssertEqual("Open stuck door (based on STR)", data.subText)
  }

  func test_ExplorationSubReviewModel_getSecretDoor_shouldBeEqual() throws {
    let viewModel = ExplorationSubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .dwarf
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let data = viewModel.getSecretDoor(for: player)
    XCTAssertEqual("SD", data.name)
    XCTAssertEqual("1-in-6", String(describing: data.value))
    XCTAssertEqual("Find secret door (1-in-6 or by class)", data.subText)
  }

  func test_ExplorationSubReviewModel_getSecretDoor_AsElf_shouldBeEqual() throws {
    let viewModel = ExplorationSubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .elf
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let data = viewModel.getSecretDoor(for: player)
    XCTAssertEqual("SD", data.name)
    XCTAssertEqual("2-in-6", String(describing: data.value))
    XCTAssertEqual("Find secret door (1-in-6 or by class)", data.subText)
  }

  func test_ExplorationSubReviewModel_findRoomTrap_shouldBeEqual() throws {
    let viewModel = ExplorationSubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .elf
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let data = viewModel.getFindRoomTrap(for: player)
    XCTAssertEqual("FT", data.name)
    XCTAssertEqual("1-in-6", String(describing: data.value))
    XCTAssertEqual("Find room trap (1-in-6 or by class)", data.subText)
  }

  func test_ExplorationSubReviewModel_findRoomTrap_asDwarf_shouldBeEqual() throws {
    let viewModel = ExplorationSubReviewModel()
    let player = PlayerCharacter()
    player.characterClass = .dwarf
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let data = viewModel.getFindRoomTrap(for: player)
    XCTAssertEqual("FT", data.name)
    XCTAssertEqual("2-in-6", String(describing: data.value))
    XCTAssertEqual("Find room trap (1-in-6 or by class)", data.subText)
  }
}
