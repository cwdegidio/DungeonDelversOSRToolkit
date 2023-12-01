//
//  LanguageEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class LanguageEnumTest: XCTestCase {
  func test_LanguageEnumTest_name_alignment_shouldBeEqual() throws {
    XCTAssertEqual("Alignment", Language.alignment.name)
  }

  func test_LanguageEnumTest_name_bugbear_shouldBeEqual() throws {
    XCTAssertEqual("Bugbear", Language.bugbear.name)
  }

  func test_LanguageEnumTest_name_doppelganger_shouldBeEqual() throws {
    XCTAssertEqual("Doppelgänger", Language.doppelganger.name)
  }

  func test_LanguageEnumTest_name_common_shouldBeEqual() throws {
    XCTAssertEqual("Common", Language.common.name)
  }

  func test_LanguageEnumTest_name_dragon_shouldBeEqual() throws {
    XCTAssertEqual("Dragon", Language.dragon.name)
  }

  func test_LanguageEnumTest_name_dwarvish_shouldBeEqual() throws {
    XCTAssertEqual("Dwarvish", Language.dwarvish.name)
  }

  func test_LanguageEnumTest_name_elvish_shouldBeEqual() throws {
    XCTAssertEqual("Elvish", Language.elvish.name)
  }

  func test_LanguageEnumTest_name_gargoyle_shouldBeEqual() throws {
    XCTAssertEqual("Gargoyle", Language.gargoyle.name)
  }

  func test_LanguageEnumTest_name_gnoll_shouldBeEqual() throws {
    XCTAssertEqual("Gnoll", Language.gnoll.name)
  }

  func test_LanguageEnumTest_name_gnomish_shouldBeEqual() throws {
    XCTAssertEqual("Gnomish", Language.gnomish.name)
  }

  func test_LanguageEnumTest_name_goblin_shouldBeEqual() throws {
    XCTAssertEqual("Goblin", Language.goblin.name)
  }

  func test_LanguageEnumTest_name_halfling_shouldBeEqual() throws {
    XCTAssertEqual("Halfling", Language.halfling.name)
  }

  func test_LanguageEnumTest_name_harpy_shouldBeEqual() throws {
    XCTAssertEqual("Harpy", Language.harpy.name)
  }

  func test_LanguageEnumTest_name_hobgoblin_shouldBeEqual() throws {
    XCTAssertEqual("Hobgoblin", Language.hobgoblin.name)
  }

  func test_LanguageEnumTest_name_kobold_shouldBeEqual() throws {
    XCTAssertEqual("Kobold", Language.kobold.name)
  }

  func test_LanguageEnumTest_name_lizardMan_shouldBeEqual() throws {
    XCTAssertEqual("Lizard Man", Language.lizardMan.name)
  }

  func test_LanguageEnumTest_name_medussa_shouldBeEqual() throws {
    XCTAssertEqual("Medussa", Language.medussa.name)
  }

  func test_LanguageEnumTest_name_minotaur_shouldBeEqual() throws {
    XCTAssertEqual("Minotaur", Language.minotaur.name)
  }

  func test_LanguageEnumTest_name_ogre_shouldBeEqual() throws {
    XCTAssertEqual("Ogre", Language.ogre.name)
  }

  func test_LanguageEnumTest_name_orcish_shouldBeEqual() throws {
    XCTAssertEqual("Orcish", Language.orcish.name)
  }

  func test_LanguageEnumTest_name_pixie_shouldBeEqual() throws {
    XCTAssertEqual("Pixie", Language.pixie.name)
  }

  func test_LanguageEnumTest_name_humanDialect_shouldBeEqual() throws {
    XCTAssertEqual("Human dialect", Language.humanDialect.name)
  }
}
