//
//  ModCalculatorLiteracyTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModCalculatorLiteracyTest: XCTestCase {
  // MARK: - getValue (literacy)
  func test_ModCalculator_getValue_shouldBeLiteracyIlliterate() {
    let modifier = CharacterMod(modType: .literacy, asscStat: .int)

    XCTAssertEqual(1, ModCalculator().getValue(for: modifier, using: 5))
  }

  func test_ModCalculator_getValue_shouldBeLiteracyBasic() {
    let modifier = CharacterMod(modType: .literacy, asscStat: .int)

    XCTAssertEqual(2, ModCalculator().getValue(for: modifier, using: 6))
  }

  func test_ModCalculator_getValue_shouldBeLiteracyLiterate() {
    let modifier = CharacterMod(modType: .literacy, asscStat: .int)

    XCTAssertEqual(3, ModCalculator().getValue(for: modifier, using: 18))
  }
}
