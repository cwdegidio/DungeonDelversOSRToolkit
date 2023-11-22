//
//  ModCaculatorRetainerMax.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModCaculatorRetainerMax: XCTestCase {
  // MARK: - getValue (retainerMax)
  func test_ModCalulator_getValue_shouldBeRetainerMax1() {
    let modifier = CharacterMod(modType: .retainerMax, asscStat: .cha)

    XCTAssertEqual(1, ModCalculator().getValue(for: modifier, using: 3))
  }

  func test_ModCalulator_getValue_shouldBeRetainerMax2() {
    let modifier = CharacterMod(modType: .retainerMax, asscStat: .cha)

    XCTAssertEqual(2, ModCalculator().getValue(for: modifier, using: 4))
  }

  func test_ModCalulator_getValue_shouldBeRetainerMax3() {
    let modifier = CharacterMod(modType: .retainerMax, asscStat: .cha)

    XCTAssertEqual(3, ModCalculator().getValue(for: modifier, using: 8))
  }

  func test_ModCalulator_getValue_shouldBeRetainerMax4() {
    let modifier = CharacterMod(modType: .retainerMax, asscStat: .cha)

    XCTAssertEqual(4, ModCalculator().getValue(for: modifier, using: 10))
  }

  func test_ModCalulator_getValue_shouldBeRetainerMax5() {
    let modifier = CharacterMod(modType: .retainerMax, asscStat: .cha)

    XCTAssertEqual(5, ModCalculator().getValue(for: modifier, using: 15))
  }

  func test_ModCalulator_getValue_shouldBeRetainerMax6() {
    let modifier = CharacterMod(modType: .retainerMax, asscStat: .cha)

    XCTAssertEqual(6, ModCalculator().getValue(for: modifier, using: 17))
  }

  func test_ModCalulator_getValue_shouldBeRetainerMax7() {
    let modifier = CharacterMod(modType: .retainerMax, asscStat: .cha)

    XCTAssertEqual(7, ModCalculator().getValue(for: modifier, using: 18))
  }
}
