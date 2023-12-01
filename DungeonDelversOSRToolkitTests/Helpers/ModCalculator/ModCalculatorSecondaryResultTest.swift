//
//  ModCalculatorSecondaryResultTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit


final class ModCalculatorSecondaryResultTest: XCTestCase {
  // MARK: - getValue (secondaryResult)
  func test_ModCalculator_getValue_shouldBeSecondaryResultMinus2default() throws {
    let modifier = CharacterMod(modType: .initiative, asscStat: .dex)

    XCTAssertEqual(-2, ModCalculator().getValue(for: modifier, using: 0))
  }

  func test_ModCalculator_getValue_shouldBeSecondaryResultMinus2() throws {
    let modifier = CharacterMod(modType: .initiative, asscStat: .dex)

    XCTAssertEqual(-2, ModCalculator().getValue(for: modifier, using: 3))
  }

  func test_ModCalculator_getValue_shouldBeSecondaryResultMinus1() throws {
    let modifier = CharacterMod(modType: .npcReaction, asscStat: .cha)

    XCTAssertEqual(-1, ModCalculator().getValue(for: modifier, using: 6))
  }

  func test_ModCalculator_getValue_shouldBeSecondaryResult0() throws {
    let modifier = CharacterMod(modType: .initiative, asscStat: .dex)

    XCTAssertEqual(0, ModCalculator().getValue(for: modifier, using: 10))
  }

  func test_ModCalculator_getValue_shouldBeSecondaryResult1() throws {
    let modifier = CharacterMod(modType: .npcReaction, asscStat: .cha)

    XCTAssertEqual(1, ModCalculator().getValue(for: modifier, using: 15))
  }

  func test_ModCalculator_getValue_shouldBeSecondaryResult2() throws {
    let modifier = CharacterMod(modType: .initiative, asscStat: .dex)

    XCTAssertEqual(2, ModCalculator().getValue(for: modifier, using: 18))
  }

  func test_ModCalculator_getValue_shouldBeOpenDoors1default() throws {
    let modifier = CharacterMod(modType: .openDoors, asscStat: .str)

    XCTAssertEqual(1, ModCalculator().getValue(for: modifier, using: 0))
  }

  func test_ModCalculator_getValue_shouldBeOpenDoors1() throws {
    let modifier = CharacterMod(modType: .openDoors, asscStat: .str)

    XCTAssertEqual(1, ModCalculator().getValue(for: modifier, using: 4))
  }

  func test_ModCalculator_getValue_shouldBeOpenDoors2() throws {
    let modifier = CharacterMod(modType: .openDoors, asscStat: .str)

    XCTAssertEqual(2, ModCalculator().getValue(for: modifier, using: 9))
  }
}
