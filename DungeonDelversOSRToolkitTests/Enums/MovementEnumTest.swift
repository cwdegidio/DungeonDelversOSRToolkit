//
//  MovementEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class MovementEnumTest: XCTestCase {
  // Name
  func test_MovementEnum_name_overland_shouldBeEqual() throws {
    XCTAssertEqual("Ov", Movement.overland.name)
  }

  func test_MovementEnum_name_exploration_shouldBeEqual() throws {
    XCTAssertEqual("Ex", Movement.exploration.name)
  }

  func test_MovementEnum_name_encounter_shouldBeEqual() throws {
    XCTAssertEqual("En", Movement.encounter.name)
  }

  // description
  func test_MovementEnum_description_overland_shouldBeEqual() throws {
    XCTAssertEqual("Overland: 1/5 base mv. rate (miles/day)", Movement.overland.description)
  }

  func test_MovementEnum_description_exploration_shouldBeEqual() throws {
    XCTAssertEqual("Exploration: base mv. rate (feet/turn)", Movement.exploration.description)
  }

  func test_MovementEnum_description_encounter_shouldBeEqual() throws {
    XCTAssertEqual("Encounter: 1/3 base mv. rate (feet/round)", Movement.encounter.description)
  }
}
