//
//  ModCalculatorSpokenLanguagesTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModCalculatorSpokenLanguagesTest: XCTestCase {
  // MARK: - getValue (spokenLanguages)
  func test_ModCalculator_getValue_shouldBeSpokenLanguagesNativeBrokenDefault() {
    let modifier = CharacterMod(modType: .spokenLanguage, asscStat: .int)

    XCTAssertEqual(1, ModCalculator().getValue(for: modifier, using: 0))
  }

  func test_ModCalculator_getValue_shouldBeSpokenLanguagesNativeBroken() {
    let modifier = CharacterMod(modType: .spokenLanguage, asscStat: .int)

    XCTAssertEqual(1, ModCalculator().getValue(for: modifier, using: 3))
  }

  func test_ModCalculator_getValue_shouldBeSpokenLanguagesNative() {
    let modifier = CharacterMod(modType: .spokenLanguage, asscStat: .int)

    XCTAssertEqual(2, ModCalculator().getValue(for: modifier, using: 5))
  }

  func test_ModCalculator_getValue_shouldBeSpokenLanguagesNativePlus1() {
    let modifier = CharacterMod(modType: .spokenLanguage, asscStat: .int)

    XCTAssertEqual(3, ModCalculator().getValue(for: modifier, using: 15))
  }

  func test_ModCalculator_getValue_shouldBeSpokenLanguagesNativePlus2() {
    let modifier = CharacterMod(modType: .spokenLanguage, asscStat: .int)

    XCTAssertEqual(4, ModCalculator().getValue(for: modifier, using: 17))
  }

  func test_ModCalculator_getValue_shouldBeSpokenLanguagesNativePlus3() {
    let modifier = CharacterMod(modType: .spokenLanguage, asscStat: .int)

    XCTAssertEqual(5, ModCalculator().getValue(for: modifier, using: 18))
  }
}
