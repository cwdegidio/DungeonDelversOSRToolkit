//
//  WeaponSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class WeaponSubReviewModelTest: XCTestCase {
  func test_WeaponSubReviewModel_getWeapons_shouldBeEqual() throws {
    let viewModel = WeaponsSubReviewModel()
    let player = PlayerCharacter()
    player.weapons.append(.sword)
    let data = viewModel.getWeapons(for: player)

    XCTAssertEqual("Sword", data[0].name)
    XCTAssertEqual("1d8", data[0].damage)
    XCTAssertEqual("60 coins", data[0].weight)
    XCTAssertEqual(["Melee"], data[0].qualities)
  }
}
