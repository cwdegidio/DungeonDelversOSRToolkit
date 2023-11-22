//
//  ModCalculatorStandardResultTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModCalculatorStandardResultTest: XCTestCase {
  // MARK: - getValue (standardResult)
  func test_ModCalculator_getValue_shouldBeStandardResultMinus3() throws {
    let modifier = CharacterMod(modType: .melee, asscStat: .str)

    XCTAssertEqual(-3, ModCalculator().getValue(for: modifier, using: 3))
  }

  func test_ModCalculator_getValue_shouldBeStandardResultMinus2() throws {
    let modifier = CharacterMod(modType: .melee, asscStat: .str)

    XCTAssertEqual(-2, ModCalculator().getValue(for: modifier, using: 4))
  }

  func test_ModCalculator_getValue_shouldBeStandardResultMinus1() throws {
    let modifier = CharacterMod(modType: .missile, asscStat: .dex)

    XCTAssertEqual(-1, ModCalculator().getValue(for: modifier, using: 7))
  }

  func test_ModCalculator_getValue_shouldBeStandardResult0() throws {
    let modifier = CharacterMod(modType: .armorClass, asscStat: .dex)

    XCTAssertEqual(0, ModCalculator().getValue(for: modifier, using: 9))
  }

  func test_ModCalculator_getValue_shouldBeStandardResult1() throws {
    let modifier = CharacterMod(modType: .hitPoints, asscStat: .con)

    XCTAssertEqual(1, ModCalculator().getValue(for: modifier, using: 13))
  }

  func test_ModCalculator_getValue_shouldBeStandardResult2() throws {
    let modifier = CharacterMod(modType: .melee, asscStat: .str)

    XCTAssertEqual(2, ModCalculator().getValue(for: modifier, using: 17))
  }

  func test_ModCalculator_getValue_shouldBeStandardResult3() throws {
    let modifier = CharacterMod(modType: .magicSaves, asscStat: .wis)

    XCTAssertEqual(3, ModCalculator().getValue(for: modifier, using: 18))
  }
}
