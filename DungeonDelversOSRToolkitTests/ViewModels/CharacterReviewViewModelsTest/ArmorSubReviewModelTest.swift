//
//  ArmorSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ArmorSubReviewModelTest: XCTestCase {
  func test_ArmorSubReviewModel_getArmor_shouldBeEqual() throws {
    let viewModel = ArmorSubReviewModel()
    let player = PlayerCharacter()
    player.armor = .chainmail
    player.hasShield = true
    let data = viewModel.getArmor(for: player)
    XCTAssertEqual("Chainmail(AC: 5), Shield", data)
  }

  func test_ArmorSubReviewModel_getArmor_noArmor_shouldBeEqual() throws {
    let viewModel = ArmorSubReviewModel()
    let player = PlayerCharacter()
    let data = viewModel.getArmor(for: player)
    XCTAssertEqual("None", data)
  }
}
