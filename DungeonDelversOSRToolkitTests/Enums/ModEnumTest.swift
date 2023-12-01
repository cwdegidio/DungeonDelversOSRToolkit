//
//  ModEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/30/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ModEnumTest: XCTestCase {
  // Name
  func test_StatEnum_name_melee_shouldBeEqual() throws {
    let name = Mod.melee.name
    XCTAssertEqual("Melee", name)
  }

  func test_StatEnum_name_openDoors_shouldBeEqual() throws {
    let name = Mod.openDoors.name
    XCTAssertEqual("Open Doors", name)
  }

  func test_StatEnum_name_armorClass_shouldBeEqual() throws {
    let name = Mod.armorClass.name
    XCTAssertEqual("AC", name)
  }

  func test_StatEnum_name_missile_shouldBeEqual() throws {
    let name = Mod.missile.name
    XCTAssertEqual("Missile", name)
  }

  func test_StatEnum_name_initiative_shouldBeEqual() throws {
    let name = Mod.initiative.name
    XCTAssertEqual("Initiative", name)
  }

  func test_StatEnum_name_hitPoints_shouldBeEqual() throws {
    let name = Mod.hitPoints.name
    XCTAssertEqual("HP", name)
  }

  func test_StatEnum_name_npcReaction_shouldBeEqual() throws {
    let name = Mod.npcReaction.name
    XCTAssertEqual("NPC Reactions", name)
  }

  func test_StatEnum_name_retainerMax_shouldBeEqual() throws {
    let name = Mod.retainerMax.name
    XCTAssertEqual("Retainers Max #", name)
  }

  func test_StatEnum_name_retainerLoyalty_shouldBeEqual() throws {
    let name = Mod.retainerLoyalty.name
    XCTAssertEqual("Retainers Loyalty", name)
  }

  func test_StatEnum_name_spokenLanguage_shouldBeEqual() throws {
    let name = Mod.spokenLanguage.name
    XCTAssertEqual("Spoken Languages", name)
  }

  func test_StatEnum_name_literacy_shouldBeEqual() throws {
    let name = Mod.literacy.name
    XCTAssertEqual("Literacy", name)
  }

  func test_StatEnum_name_magicSaves_shouldBeEqual() throws {
    let name = Mod.magicSaves.name
    XCTAssertEqual("Magic Saves", name)
  }

  // Description
  func test_StatEnum_description_melee_shouldBeEqual() throws {
    let description = Mod.melee.description
    XCTAssertEqual("Is applied to attack and damage rolls with melee weapons.", description)
  }

  func test_StatEnum_description_openDoors_shouldBeEqual() throws {
    let description = Mod.openDoors.description
    XCTAssertEqual("The chance of success with attempts to force open a stuck door", description)
  }

  func test_StatEnum_description_armorClass_shouldBeEqual() throws {
    let description = Mod.armorClass.description
    XCTAssertEqual("Modifies the character’s AC (a bonus lowers AC, a penalty raises it).", description)
  }

  func test_StatEnum_description_missile_shouldBeEqual() throws {
    let description = Mod.missile.description
    XCTAssertEqual("Applied to attack rolls (but not damage rolls) with ranged weapons.", description)
  }

  func test_StatEnum_description_initiative_shouldBeEqual() throws {
    let description = Mod.initiative.description
    XCTAssertEqual("Modifies the character’s initiative roll.", description)
  }

  func test_StatEnum_description_hitPoints_shouldBeEqual() throws {
    let description = Mod.hitPoints.description
    XCTAssertEqual("Applies when rolling a character’s hit points.", description)
  }

  func test_StatEnum_description_npcReaction_shouldBeEqual() throws {
    let description = Mod.npcReaction.description
    XCTAssertEqual("Applies when hiring retainers and when interacting with monsters.", description)
  }

  func test_StatEnum_description_retainerMax_shouldBeEqual() throws {
    let description = Mod.retainerMax.description
    XCTAssertEqual("Determines the number of retainers a character may have at any one time.", description)
  }

  func test_StatEnum_description_retainerLoyalty_shouldBeEqual() throws {
    let description = Mod.retainerLoyalty.description
    XCTAssertEqual("Determines retainers’ loyalty to the character.", description)
  }

  func test_StatEnum_description_spokenLanguage_shouldBeEqual() throws {
    let description = Mod.spokenLanguage.description
    XCTAssertEqual("Denotes the number of languages the character can speak.", description)
  }

  func test_StatEnum_description_literacy_shouldBeEqual() throws {
    let description = Mod.literacy.description
    XCTAssertEqual("Indicates the character’s ability to read and write their native languages.", description)
  }

  func test_StatEnum_description_magicSaves_shouldBeEqual() throws {
    let description = Mod.magicSaves.description
    XCTAssertEqual("Is applied to saving throws versus magical effects.", description)
  }
}
