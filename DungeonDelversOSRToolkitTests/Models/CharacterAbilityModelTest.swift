//
//  CharacterAbilityModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class CharacterAbilityModelTest: XCTestCase {
  func test_CharacterAbilityModel_init_shouldBeEqual() throws {
    let ability = CharacterAbility(statType: .str, score: 18)

    XCTAssertEqual(Stat.str, ability.statType)
    XCTAssertEqual(18, ability.score)
  }
}
