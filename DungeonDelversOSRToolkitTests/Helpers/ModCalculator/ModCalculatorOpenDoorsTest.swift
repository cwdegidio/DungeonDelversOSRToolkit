//
//  ModCalculatorOpenDoorsTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModCalculatorOpenDoorsTest: XCTestCase {
  // MARK: - getValue (openDoors)
  func test_ModCalculator_getValue_shouldBeOpenDoors3() throws {
    let modifier = CharacterMod(modType: .openDoors, asscStat: .str)

    XCTAssertEqual(3, ModCalculator().getValue(for: modifier, using: 14))
  }

  func test_ModCalculator_getValue_shouldBeOpenDoors4() throws {
    let modifier = CharacterMod(modType: .openDoors, asscStat: .str)

    XCTAssertEqual(4, ModCalculator().getValue(for: modifier, using: 17))
  }

  func test_ModCalculator_getValue_shouldBeOpenDoors5() throws {
    let modifier = CharacterMod(modType: .openDoors, asscStat: .str)

    XCTAssertEqual(5, ModCalculator().getValue(for: modifier, using: 18))
  }
}
