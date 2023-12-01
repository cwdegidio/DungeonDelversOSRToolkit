//
//  StatEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/30/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class StatEnumTest: XCTestCase {
  // Name
  func test_StatEnum_name_str_shouldBeEqual() throws {
    let desc = Stat.str.name
    XCTAssertEqual("Strength", desc)
  }

  func test_StatEnum_name_dex_shouldBeEqual() throws {
    let desc = Stat.dex.name
    XCTAssertEqual("Dexterity", desc)
  }

  func test_StatEnum_name_con_shouldBeEqual() throws {
    let desc = Stat.con.name
    XCTAssertEqual("Constitution", desc)
  }

  func test_StatEnum_name_int_shouldBeEqual() throws {
    let desc = Stat.int.name
    XCTAssertEqual("Intelligence", desc)
  }

  func test_StatEnum_name_wis_shouldBeEqual() throws {
    let desc = Stat.wis.name
    XCTAssertEqual("Wisdom", desc)
  }

  func test_StatEnum_name_cha_shouldBeEqual() throws {
    let desc = Stat.cha.name
    XCTAssertEqual("Charisma", desc)
  }

  // Short name
  func test_StatEnum_shortName_str_shouldBeEqual() throws {
    let desc = Stat.str.shortName
    XCTAssertEqual("Str", desc)
  }

  func test_StatEnum_shortName_dex_shouldBeEqual() throws {
    let desc = Stat.dex.shortName
    XCTAssertEqual("Dex", desc)
  }

  func test_StatEnum_shortName_con_shouldBeEqual() throws {
    let desc = Stat.con.shortName
    XCTAssertEqual("Con", desc)
  }

  func test_StatEnum_shortName_int_shouldBeEqual() throws {
    let desc = Stat.int.shortName
    XCTAssertEqual("Int", desc)
  }

  func test_StatEnum_shortName_wis_shouldBeEqual() throws {
    let desc = Stat.wis.shortName
    XCTAssertEqual("Wis", desc)
  }

  func test_StatEnum_shortName_cha_shouldBeEqual() throws {
    let desc = Stat.cha.shortName
    XCTAssertEqual("Cha", desc)
  }

  // Description
  func test_StatEnum_description_str_shouldBeEqual() throws {
    let desc = Stat.str.description
    XCTAssertEqual("Brawn, muscle, and physical power.", desc)
  }

  func test_StatEnum_description_dex_shouldBeEqual() throws {
    let desc = Stat.dex.description
    XCTAssertEqual("Agility, reflexes, speed, and balance.", desc)
  }

  func test_StatEnum_description_con_shouldBeEqual() throws {
    let desc = Stat.con.description
    XCTAssertEqual("Health, stamina, and endurance.", desc)
  }

  func test_StatEnum_description_int_shouldBeEqual() throws {
    let desc = Stat.int.description
    XCTAssertEqual("Learning, memory, and reasoning.", desc)
  }

  func test_StatEnum_description_wis_shouldBeEqual() throws {
    let desc = Stat.wis.description
    XCTAssertEqual("Willpower, common sense, perception, and intuition.", desc)
  }

  func test_StatEnum_description_cha_shouldBeEqual() throws {
    let desc = Stat.cha.description
    XCTAssertEqual(
      "Force of personality, persuasiveness, personal magnetism, " +
      "physical attractiveness, and ability to lead.", desc)
  }
}
