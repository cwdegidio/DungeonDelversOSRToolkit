//
//  AlignmentEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/30/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class AlignmentEnumTest: XCTestCase {
  func test_AlignmentEnum_name_law_shouldBeEqual() throws {
    XCTAssertEqual("Law", Alignment.law.name)
  }

  func test_AlignmentEnum_name_neutrality_shouldBeEqual() throws {
    XCTAssertEqual("Neutrality", Alignment.neutrality.name)
  }

  func test_AlignmentEnum_name_chaos_shouldBeEqual() throws {
    XCTAssertEqual("Chaos", Alignment.chaos.name)
  }
}
