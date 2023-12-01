//
//  TypeFaceEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/30/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class TypeFaceEnumTest: XCTestCase {
  func test_TypeFaceEnumTest_die4_name_shouldBeEqual() throws {
    XCTAssertEqual("Art'sPolyhedralDiceD4Rounded", TypeFace.die4.name)
  }

  func test_TypeFaceEnumTest_die6_name_shouldBeEqual() throws {
    XCTAssertEqual("Art'sPolyhedralDiceD6", TypeFace.die6.name)
  }

  func test_TypeFaceEnumTest_die8_name_shouldBeEqual() throws {
    XCTAssertEqual("Art'sPolyhedralDiceD8", TypeFace.die8.name)
  }

  func test_TypeFaceEnumTest_die10_name_shouldBeEqual() throws {
    XCTAssertEqual("Art'sPolyhedralDiceD10", TypeFace.die10.name)
  }

  func test_TypeFaceEnumTest_die12_name_shouldBeEqual() throws {
    XCTAssertEqual("Art'sPolyhedralDiceD12", TypeFace.die12.name)
  }

  func test_TypeFaceEnumTest_die20_name_shouldBeEqual() throws {
    XCTAssertEqual("Art'sPolyhedralDiceD20", TypeFace.die20.name)
  }
}
