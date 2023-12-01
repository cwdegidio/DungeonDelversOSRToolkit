//
//  SpokenLanguageEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/30/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class SpokenLanguageEnumTest: XCTestCase {
  func test_SpokenLanguageEnum_nativeBroken_shouldBeEqual() throws {
    XCTAssertEqual(1, SpokenLanguage.nativeBroken.rawValue)
  }

  func test_SpokenLanguageEnum_native_shouldBeEqual() throws {
    XCTAssertEqual(2, SpokenLanguage.native.rawValue)
  }

  func test_SpokenLanguageEnum_nativePlus1_shouldBeEqual() throws {
    XCTAssertEqual(3, SpokenLanguage.nativePlus1.rawValue)
  }

  func test_SpokenLanguageEnum_nativePlus2_shouldBeEqual() throws {
    XCTAssertEqual(4, SpokenLanguage.nativePlus2.rawValue)
  }

  func test_SpokenLanguageEnum_nativePlus3_shouldBeEqual() throws {
    XCTAssertEqual(5, SpokenLanguage.nativePlus3.rawValue)
  }
}
