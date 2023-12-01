//
//  CombatValueEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class CombatValueEnumTest: XCTestCase {
  // Name
  func test_CombatValueEnum_name_armorClass_shouldBeEqual() throws {
    XCTAssertEqual("AC", CombatValue.armorClass.name)
  }

  func test_CombatValueEnum_name_meleeBonus_shouldBeEqual() throws {
    XCTAssertEqual("Mel", CombatValue.meleeBonus.name)
  }

  func test_CombatValueEnum_name_maxHP_shouldBeEqual() throws {
    XCTAssertEqual("Max", CombatValue.maxHP.name)
  }

  func test_CombatValueEnum_name_conBonusHP_shouldBeEqual() throws {
    XCTAssertEqual("±", CombatValue.conBonusHP.name)
  }

  func test_CombatValueEnum_name_unarmoredAC_shouldBeEqual() throws {
    XCTAssertEqual("Un", CombatValue.unarmoredAC.name)
  }

  func test_CombatValueEnum_name_dexBonusAC_shouldBeEqual() throws {
    XCTAssertEqual("±", CombatValue.dexBonusAC.name)
  }

  func test_CombatValueEnum_name_missileAttacks_shouldBeEqual() throws {
    XCTAssertEqual("Mis", CombatValue.missileAttacks.name)
  }

  // description
  func test_CombatValueEnum_description_armorClass_shouldBeEqual() throws {
    XCTAssertEqual("Armor Class", CombatValue.armorClass.description)
  }

  func test_CombatValueEnum_description_meleeBonus_shouldBeEqual() throws {
    XCTAssertEqual("STR modifier to melee attack / damage", CombatValue.meleeBonus.description)
  }

  func test_CombatValueEnum_description_maxHP_shouldBeEqual() throws {
    XCTAssertEqual("Maximum hit points", CombatValue.maxHP.description)
  }

  func test_CombatValueEnum_description_conBonusHP_shouldBeEqual() throws {
    XCTAssertEqual("CON modifier to hit points", CombatValue.conBonusHP.description)
  }

  func test_CombatValueEnum_description_unarmoredAC_shouldBeEqual() throws {
    XCTAssertEqual("Unarmored AC: 9 + DEX Modifier", CombatValue.unarmoredAC.description)
  }

  func test_CombatValueEnum_description_dexBonusAC_shouldBeEqual() throws {
    XCTAssertEqual("DEX modifier to Armor Class", CombatValue.dexBonusAC.description)
  }

  func test_CombatValueEnum_description_missileAttacks_shouldBeEqual() throws {
    XCTAssertEqual("DEX modifier to missile attacks", CombatValue.missileAttacks.description)
  }
}
