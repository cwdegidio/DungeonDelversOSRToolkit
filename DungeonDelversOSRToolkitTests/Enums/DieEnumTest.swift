//
//  DieEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class DieEnumTest: XCTestCase {
  // Description
  func test_DieEnumTest_d4_description_shouldBeEqual() throws {
    XCTAssertEqual("d4", Die.die4.description)
  }

  func test_DieEnumTest_d6_description_shouldBeEqual() throws {
    XCTAssertEqual("d6", Die.die6.description)
  }

  func test_DieEnumTest_d8_description_shouldBeEqual() throws {
    XCTAssertEqual("d8", Die.die8.description)
  }

  func test_DieEnumTest_d10_description_shouldBeEqual() throws {
    XCTAssertEqual("d10", Die.die10.description)
  }

  func test_DieEnumTest_d12_description_shouldBeEqual() throws {
    XCTAssertEqual("d12", Die.die12.description)
  }

  func test_DieEnumTest_d20_description_shouldBeEqual() throws {
    XCTAssertEqual("d20", Die.die20.description)
  }

  // Die Face
  func test_DieEnumTest_d4_dieFaces_shouldBeEqual() throws {
    XCTAssertEqual(["A", "D", "G", "J"], Die.die4.dieFaces)
  }

  func test_DieEnumTest_d6_dieFaces_shouldBeEqual() throws {
    XCTAssertEqual(["A", "B", "C", "D", "E", "F"], Die.die6.dieFaces)
  }

  func test_DieEnumTest_d8_dieFaces_shouldBeEqual() throws {
    XCTAssertEqual(["A", "B", "C", "D", "E", "F", "G", "H"], Die.die8.dieFaces)
  }

  func test_DieEnumTest_d10_dieFaces_shouldBeEqual() throws {
    XCTAssertEqual(["A", "B", "C", "D", "E", "F", "G", "H", "I", "K"], Die.die10.dieFaces)
  }

  func test_DieEnumTest_d12_dieFaces_shouldBeEqual() throws {
    XCTAssertEqual(
      ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"],
      Die.die12.dieFaces
    )
  }

  func test_DieEnumTest_d20_dieFaces_shouldBeEqual() throws {
    XCTAssertEqual(
      ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"],
      Die.die20.dieFaces
    )
  }

  // TypeFace
  func test_DieEnumTest_d4_typeFace_shouldBeEqual() throws {
    XCTAssertEqual(TypeFace.die4, Die.die4.typeFace)
  }

  func test_DieEnumTest_d6_typeFace_shouldBeEqual() throws {
    XCTAssertEqual(TypeFace.die6, Die.die6.typeFace)
  }

  func test_DieEnumTest_d8_typeFace_shouldBeEqual() throws {
    XCTAssertEqual(TypeFace.die8, Die.die8.typeFace)
  }

  func test_DieEnumTest_d10_typeFace_shouldBeEqual() throws {
    XCTAssertEqual(TypeFace.die10, Die.die10.typeFace)
  }

  func test_DieEnumTest_d12_typeFace_shouldBeEqual() throws {
    XCTAssertEqual(TypeFace.die12, Die.die12.typeFace)
  }

  func test_DieEnumTest_d20_typeFace_shouldBeEqual() throws {
    XCTAssertEqual(TypeFace.die20, Die.die20.typeFace)
  }

  // Art's Polyhedral Offsets
  func test_DieEnumTest_d4_baselineOffset_shouldBeEqual() throws {
    XCTAssertEqual(55.0, Die.die4.baselineOffset)
  }

  func test_DieEnumTest_d6_baselineOffset_shouldBeEqual() throws {
    XCTAssertEqual(-15.0, Die.die6.baselineOffset)
  }

  func test_DieEnumTest_d8_baselineOffset_shouldBeEqual() throws {
    XCTAssertEqual(-15.0, Die.die8.baselineOffset)
  }

  func test_DieEnumTest_d10_baselineOffset_shouldBeEqual() throws {
    XCTAssertEqual(-15.0, Die.die10.baselineOffset)
  }

  func test_DieEnumTest_d12_baselineOffset_shouldBeEqual() throws {
    XCTAssertEqual(-15.0, Die.die12.baselineOffset)
  }

  func test_DieEnumTest_d20_baselineOffset_shouldBeEqual() throws {
    XCTAssertEqual(-15.0, Die.die20.baselineOffset)
  }
}
