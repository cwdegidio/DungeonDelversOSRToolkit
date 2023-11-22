//
//  ModCalculatorRetainerLoyalty.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModCalculatorRetainerLoyalty: XCTestCase {
  // MARK: - getValue (retainerLoyalty)
  func test_ModCalculator_getValue_shouldBeRetainerLoyalty4() {
    let modifier = CharacterMod(modType: .retainerLoyalty, asscStat: .cha)

    XCTAssertEqual(4, ModCalculator().getValue(for: modifier, using: 3))
  }

  func test_ModCalculator_getValue_shouldBeRetainerLoyalty5() {
    let modifier = CharacterMod(modType: .retainerLoyalty, asscStat: .cha)

    XCTAssertEqual(5, ModCalculator().getValue(for: modifier, using: 5))
  }

  func test_ModCalculator_getValue_shouldBeRetainerLoyalty6() {
    let modifier = CharacterMod(modType: .retainerLoyalty, asscStat: .cha)

    XCTAssertEqual(6, ModCalculator().getValue(for: modifier, using: 7))
  }

  func test_ModCalculator_getValue_shouldBeRetainerLoyalty7() {
    let modifier = CharacterMod(modType: .retainerLoyalty, asscStat: .cha)

    XCTAssertEqual(7, ModCalculator().getValue(for: modifier, using: 12))
  }

  func test_ModCalculator_getValue_shouldBeRetainerLoyalty8() {
    let modifier = CharacterMod(modType: .retainerLoyalty, asscStat: .cha)

    XCTAssertEqual(8, ModCalculator().getValue(for: modifier, using: 15))
  }

  func test_ModCalculator_getValue_shouldBeRetainerLoyalty9() {
    let modifier = CharacterMod(modType: .retainerLoyalty, asscStat: .cha)

    XCTAssertEqual(9, ModCalculator().getValue(for: modifier, using: 17))
  }

  func test_ModCalculator_getValue_shouldBeRetainerLoyalty10() {
    let modifier = CharacterMod(modType: .retainerLoyalty, asscStat: .cha)

    XCTAssertEqual(10, ModCalculator().getValue(for: modifier, using: 18))
  }
}
