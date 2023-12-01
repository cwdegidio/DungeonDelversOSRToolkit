//
//  MUSpellEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class MUSpellEnumTest: XCTestCase {
  // Name
  func test_MUSpellEnum_name_charmPerson_shouldBeEqual() throws {
    XCTAssertEqual("Charm Person", MUSpell.charmPerson.name)
  }

  func test_MUSpellEnum_name_detectMagic_shouldBeEqual() throws {
    XCTAssertEqual("Detect Magic", MUSpell.detectMagic.name)
  }

  func test_MUSpellEnum_name_floatingDisc_shouldBeEqual() throws {
    XCTAssertEqual("Floating Disc", MUSpell.floatingDisc.name)
  }

  func test_MUSpellEnum_name_holdPortal_shouldBeEqual() throws {
    XCTAssertEqual("Hold Portal", MUSpell.holdPortal.name)
  }

  func test_MUSpellEnum_name_light_shouldBeEqual() throws {
    XCTAssertEqual("Light", MUSpell.light.name)
  }

  func test_MUSpellEnum_name_magicMissile_shouldBeEqual() throws {
    XCTAssertEqual("Magic Missile", MUSpell.magicMissile.name)
  }

  func test_MUSpellEnum_name_protectionFromEvil_shouldBeEqual() throws {
    XCTAssertEqual("Protection from Evil", MUSpell.protectionFromEvil.name)
  }

  func test_MUSpellEnum_name_readLanguages_shouldBeEqual() throws {
    XCTAssertEqual("Read Languages", MUSpell.readLanguages.name)
  }

  func test_MUSpellEnum_name_readMagic_shouldBeEqual() throws {
    XCTAssertEqual("Read Magic", MUSpell.readMagic.name)
  }

  func test_MUSpellEnum_name_shield_shouldBeEqual() throws {
    XCTAssertEqual("Shield", MUSpell.shield.name)
  }

  func test_MUSpellEnum_name_sleep_shouldBeEqual() throws {
    XCTAssertEqual("Sleep", MUSpell.sleep.name)
  }

  func test_MUSpellEnum_name_ventriloquism_shouldBeEqual() throws {
    XCTAssertEqual("Ventriloquism", MUSpell.ventriloquism.name)
  }
}
