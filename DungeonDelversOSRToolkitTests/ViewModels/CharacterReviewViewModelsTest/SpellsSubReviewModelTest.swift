//
//  SpellsSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class SpellsSubReviewModelTest: XCTestCase {
  func test_SpellsSubReviewModel_getMagicUserSpells_shouldBeEqual() throws {
    let viewModel = SpellSubReviewModel()
    let player = PlayerCharacter()
    player.spells = [.floatingDisc, .magicMissile]
    let data = viewModel.getMagicUserSpells(for: player)

    XCTAssertEqual(["Floating Disc", "Magic Missile"], data)
  }
}
