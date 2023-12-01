//
//  SavingThrowEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class SavingThrowEnumTest: XCTestCase {
  func test_SavingThrowEnum_name_death_shouldBeEqual() throws {
    XCTAssertEqual("Death / poison", SavingThrow.death.name)
  }

  func test_SavingThrowEnum_name_wands_shouldBeEqual() throws {
    XCTAssertEqual("Wands", SavingThrow.wands.name)
  }

  func test_SavingThrowEnum_name_paralysis_shouldBeEqual() throws {
    XCTAssertEqual("Paralysis / petrify", SavingThrow.paralysis.name)
  }

  func test_SavingThrowEnumbreath_death_shouldBeEqual() throws {
    XCTAssertEqual("Breath attacks", SavingThrow.breath.name)
  }

  func test_SavingThrowEnum_name_spells_shouldBeEqual() throws {
    XCTAssertEqual("Spells / rods / staves", SavingThrow.spells.name)
  }
}
