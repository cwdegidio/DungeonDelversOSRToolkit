//
//  ModifierViewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModifierViewModelTest: XCTestCase {
  func test_ModifierViewModelTest_getModifierString_shouldBeNumericBonusStringPlus3() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 6),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .melee })
    XCTAssertEqual("+3", viewModel.getModifierString(for: modifier, player: player))
  }

  func test_ModifierViewModelTest_getModifierString_shouldBeNumericBonusStringMinus1() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 6),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .missile })
    XCTAssertEqual("-1", viewModel.getModifierString(for: modifier, player: player))
  }

  func test_ModifierViewModelTest_getModifierString_shouldBeIlliterate() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 3),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .literacy })
    XCTAssertEqual("Illiterate", viewModel.getModifierString(for: modifier, player: player))
  }

  func test_ModifierViewModelTest_getModifierString_shouldBeBasic() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 6),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .literacy })
    XCTAssertEqual("Basic", viewModel.getModifierString(for: modifier, player: player))
  }

  func test_ModifierViewModelTest_getModifierString_shouldBeLiterate() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .literacy })
    XCTAssertEqual("Literate", viewModel.getModifierString(for: modifier, player: player))
  }

  func test_ModifierViewModelTest_getModifierString_shouldBeNativeBroken() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 3),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .spokenLanguage })
    XCTAssertEqual("Native (broken speech)", viewModel.getModifierString(for: modifier, player: player))
  }

  func test_ModifierViewModelTest_getModifierString_shouldBeNative() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 8),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .spokenLanguage })
    XCTAssertEqual("Native", viewModel.getModifierString(for: modifier, player: player))
  }

  func test_ModifierViewModelTest_getModifierString_shouldBeNativePlus1() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 15),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .spokenLanguage })
    XCTAssertEqual("Native + 1 additional", viewModel.getModifierString(for: modifier, player: player))
  }

  func test_ModifierViewModelTest_getModifierString_shouldBeNativePlus2() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 17),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .spokenLanguage })
    XCTAssertEqual("Native + 2 additional", viewModel.getModifierString(for: modifier, player: player))
  }

  func test_ModifierViewModelTest_getModifierString_shouldBeNativePlus3() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .spokenLanguage })
    XCTAssertEqual("Native + 3 additional", viewModel.getModifierString(for: modifier, player: player))
  }

  func test_ModifierViewModelTest_getModifierString_shouldBe1_in_6() throws {
    let viewModel = ModifierViewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 3),
      CharacterAbility(statType: .dex, score: 6),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let modifier = try XCTUnwrap(player.modifiers.first { $0.modType == .openDoors })
    XCTAssertEqual("1-in-6", viewModel.getModifierString(for: modifier, player: player))
  }
}
