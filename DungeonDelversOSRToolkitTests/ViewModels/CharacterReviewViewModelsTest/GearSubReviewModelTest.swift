//
//  GearSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class GearSubReviewModelTest: XCTestCase {
  func test_GearSubReviewModel_getGear_shouldBeEqual() throws {
    let viewModel = GearSubReviewModel()
    let player = PlayerCharacter()
    player.gear.append(.backpack)
    player.gear.append(.torches)
    player.gear.append(.lantern)
    let data = viewModel.getGear(for: player)

    XCTAssertEqual(["Backpack", "Torches (6)", "Lantern"], data)
  }
}
