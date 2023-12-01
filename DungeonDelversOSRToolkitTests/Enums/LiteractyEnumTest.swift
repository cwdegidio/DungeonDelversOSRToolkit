//
//  LiteractyEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/30/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class LiteractyEnumTest: XCTestCase {
  func test_LiteracyEnum_illiterate_shouldBeEqual() throws {
    XCTAssertEqual(1, Literacy.illiterate.rawValue)
  }

  func test_LiteracyEnum_basic_shouldBeEqual() throws {
    XCTAssertEqual(2, Literacy.basic.rawValue)
  }

  func test_LiteracyEnum_literate_shouldBeEqual() throws {
    XCTAssertEqual(3, Literacy.literate.rawValue)
  }
}
