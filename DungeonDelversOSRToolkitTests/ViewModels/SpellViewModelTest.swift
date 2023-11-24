//
//  SpellViewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/23/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class SpellViewModelTest: XCTestCase {
  func test_SpellViewModel_updatePlayerSpells_nonEmptyList_shouldBeEqual() {
    let viewModel = SpellsViewModel()
    let player = PlayerCharacter()
    player.spells = [.charmPerson]
    viewModel.updatePlayerSpells(for: player, with: .magicMissile)
    XCTAssertEqual([.magicMissile], player.spells)
  }

  func test_SpellViewModel_updatePlayerSpells_emptyList_shouldBeEqual() {
    let viewModel = SpellsViewModel()
    let player = PlayerCharacter()
    player.spells = []
    viewModel.updatePlayerSpells(for: player, with: .magicMissile)
    XCTAssertEqual([.magicMissile], player.spells)
  }
}
