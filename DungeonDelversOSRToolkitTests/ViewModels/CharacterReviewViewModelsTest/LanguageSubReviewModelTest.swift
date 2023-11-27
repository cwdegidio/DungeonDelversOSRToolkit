//
//  LanguageSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class LanguageSubReviewModelTest: XCTestCase {
  func test_LanguageSubReviewModel_getLanguages_shouldBeEqual() throws {
    let viewModel = LanguageSubReviewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    player.characterClass = .fighter
    player.additionalLanguages = [.dragon, .elvish, .gnoll]
    let data = viewModel.getLanguages(for: player)

    XCTAssertEqual("Alignment, Common, Dragon, Elvish, Gnoll", data)
  }

  func test_LanguageSubReviewModel_getLiteracy_Illiterate_shouldBeEqual() throws {
    let viewModel = LanguageSubReviewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 3),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let data = viewModel.getLiteracy(for: player)

    XCTAssertEqual("Illiterate", data)
  }

  func test_LanguageSubReviewModel_getLiteracy_Basic_shouldBeEqual() throws {
    let viewModel = LanguageSubReviewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 6),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let data = viewModel.getLiteracy(for: player)

    XCTAssertEqual("Basic", data)
  }

  func test_LanguageSubReviewModel_getLiteracy_Literate_shouldBeEqual() throws {
    let viewModel = LanguageSubReviewModel()
    let player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 17),
      CharacterAbility(statType: .dex, score: 13),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 10),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let data = viewModel.getLiteracy(for: player)

    XCTAssertEqual("Literate", data)
  }
}
