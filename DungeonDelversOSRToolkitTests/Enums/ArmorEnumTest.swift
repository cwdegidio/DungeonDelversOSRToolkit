//
//  ArmorEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ArmorEnumTest: XCTestCase {
  // Name
  func test_ArmorEnum_name_leather_shouldBeEqual() throws {
    XCTAssertEqual("Leather", Armor.leather.name)
  }

  func test_ArmorEnum_name_chainmail_shouldBeEqual() throws {
    XCTAssertEqual("Chainmail", Armor.chainmail.name)
  }

  func test_ArmorEnum_name_plateMail_shouldBeEqual() throws {
    XCTAssertEqual("Plate mail", Armor.plateMail.name)
  }

  func test_ArmorEnum_name_shield_shouldBeEqual() throws {
    XCTAssertEqual("Shield", Armor.shield.name)
  }

  // Armor Class
  func test_ArmorEnum_armorClass_leather_shouldBeEqual() throws {
    XCTAssertEqual(7, Armor.leather.armorClass)
  }

  func test_ArmorEnum_armorClass_chainmail_shouldBeEqual() throws {
    XCTAssertEqual(5, Armor.chainmail.armorClass)
  }

  func test_ArmorEnum_armorClass_plateMail_shouldBeEqual() throws {
    XCTAssertEqual(3, Armor.plateMail.armorClass)
  }

  func test_ArmorEnum_armorClass_shield_shouldBeEqual() throws {
    XCTAssertEqual(1, Armor.shield.armorClass)
  }

  // Cost
  func test_ArmorEnum_cost_leather_shouldBeEqual() throws {
    XCTAssertEqual(20, Armor.leather.cost)
  }

  func test_ArmorEnum_cost_chainmail_shouldBeEqual() throws {
    XCTAssertEqual(40, Armor.chainmail.cost)
  }

  func test_ArmorEnum_cost_plateMail_shouldBeEqual() throws {
    XCTAssertEqual(60, Armor.plateMail.cost)
  }

  func test_ArmorEnum_cost_shield_shouldBeEqual() throws {
    XCTAssertEqual(10, Armor.shield.cost)
  }

  // Cost
  func test_ArmorEnum_weight_leather_shouldBeEqual() throws {
    XCTAssertEqual(200, Armor.leather.weight)
  }

  func test_ArmorEnum_weight_chainmail_shouldBeEqual() throws {
    XCTAssertEqual(400, Armor.chainmail.weight)
  }

  func test_ArmorEnum_weight_plateMail_shouldBeEqual() throws {
    XCTAssertEqual(500, Armor.plateMail.weight)
  }

  func test_ArmorEnum_weight_shield_shouldBeEqual() throws {
    XCTAssertEqual(100, Armor.shield.weight)
  }

  // Image Name
  func test_ArmorEnum_imgName_leather_shouldBeEqual() throws {
    XCTAssertEqual("aLeather", Armor.leather.imgName)
  }

  func test_ArmorEnum_imgName_chainmail_shouldBeEqual() throws {
    XCTAssertEqual("aChainmail", Armor.chainmail.imgName)
  }

  func test_ArmorEnum_imgName_plateMail_shouldBeEqual() throws {
    XCTAssertEqual("aPlateMail", Armor.plateMail.imgName)
  }

  func test_ArmorEnum_imgName_shield_shouldBeEqual() throws {
    XCTAssertEqual("aShield", Armor.shield.imgName)
  }

  // Description
  func test_ArmorEnum_description_leather_shouldBeEqual() throws {
    let desc = "Leather armor is a type of armor made primarily from hardened leather. " +
    "It has the advantage of being light and inexpensive, but provides less protection than heavier metal armors."
    XCTAssertEqual(desc, Armor.leather.description)
  }

  func test_ArmorEnum_description_chainmail_shouldBeEqual() throws {
    let desc = "Chainmail is a common form of armor made of interlocking metal rings. " +
    "Clothing is typically worn underneath such an article to prevent chafing, bruising, and irritation."
    XCTAssertEqual(desc, Armor.chainmail.description)
  }

  func test_ArmorEnum_description_plateMail_shouldBeEqual() throws {
    let desc = "Plate mail consists of shaped, interlocking plates. These plates cover the entire body. " +
    "Beneath the metal is a thick layer of padding and numerous straps and harnesses to distribute the weight."
    XCTAssertEqual(desc, Armor.plateMail.description)
  }

  func test_ArmorEnum_description_shield_shouldBeEqual() throws {
    let desc = "Shields are usually made from wood or metal, and are used by combatants to gain extra protection. " +
    "Shields are carried in one hand, usually strapped to the arm that carries them."
    XCTAssertEqual(desc, Armor.shield.description)
  }
}
