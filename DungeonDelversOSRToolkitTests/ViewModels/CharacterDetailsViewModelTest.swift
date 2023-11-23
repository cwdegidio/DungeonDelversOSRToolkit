//
//  CharacterDetailsViewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/22/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class CharacterDetailsViewModelTest: XCTestCase {
  func test_CharacterDetailViewModel_generateStartingGold_shouldBeTrue() throws {
    let player = PlayerCharacter()
    let viewModel = CharacterDetailsViewModel()
    let gold: Int
    viewModel.generateStartingGold(for: player)
    if let goldPieces = player.coins.first(where: { $0.key == .goldPieces }) {
      gold = goldPieces.value
      XCTAssertLessThanOrEqual(gold, 180)
      XCTAssertGreaterThanOrEqual(gold, 30)
    }
  }

  func test_CharacterDetailViewModel_setPlayerAlignment_shouldBeTrue() throws {
    let player = PlayerCharacter()
    let viewModel = CharacterDetailsViewModel()
    viewModel.setPlayerAlignment(.chaos, for: player)
    XCTAssertEqual(Alignment.chaos, player.alignment)
  }

  func test_CharacterDetailViewModel_generateCharactersMaxHP_higherThan0_shouldBeTrue() throws {
    let player = PlayerCharacter()
    let viewModel = CharacterDetailsViewModel()
    if let i = player.abilityScores.firstIndex(where: { $0.statType == .con }) {
      player.abilityScores[i].score = 18
    }
    player.characterClass = .fighter

    let hitPointsRolled = 6
    viewModel.generateCharactersMaxHP(hitPoints: hitPointsRolled, for: player)

    XCTAssertEqual(9, player.pcHitPoints)
  }

  func test_CharacterDetailViewModel_generateCharactersMaxHP_lowerThan0_shouldBeTrue() throws {
    let player = PlayerCharacter()
    let viewModel = CharacterDetailsViewModel()
    if let i = player.abilityScores.firstIndex(where: { $0.statType == .con }) {
      player.abilityScores[i].score = 3
    }
    player.characterClass = .fighter

    let hitPointsRolled = 1
    viewModel.generateCharactersMaxHP(hitPoints: hitPointsRolled, for: player)

    XCTAssertEqual(1, player.pcHitPoints)
  }

  func test_CharacterDetailViewModel_getModifierValue_ifLetFail_shouldBeTrue() throws {
    let player = PlayerCharacter()
    let viewModel = CharacterDetailsViewModel()
    player.abilityScores.removeAll { $0.statType == .con }
    let modValue = viewModel.getHPModifierValue(for: player)

    XCTAssertEqual(0, modValue)
  }
}
