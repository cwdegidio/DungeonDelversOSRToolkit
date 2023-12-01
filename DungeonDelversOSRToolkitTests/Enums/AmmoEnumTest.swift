//
//  AmmoEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class AmmoEnumTest: XCTestCase {
  // Name
  func test_AmmoEnum_name_arrows_shouldBeEqual() throws {
    XCTAssertEqual("Arrows (quiver of 20)", Ammo.arrows.name)
  }

  func test_AmmoEnum_name_crossbowBolts_shouldBeEqual() throws {
    XCTAssertEqual("Crossbow Bolts (case of 30)", Ammo.crossbowBolts.name)
  }

  func test_AmmoEnum_name_silverTippedArrow_shouldBeEqual() throws {
    XCTAssertEqual("Silver tipped arrows (1)", Ammo.silverTippedArrow.name)
  }

  func test_AmmoEnum_name_slingStones_shouldBeEqual() throws {
    XCTAssertEqual("Sling stones", Ammo.slingStones.name)
  }

  // cost
  func test_AmmoEnum_cost_arrows_shouldBeEqual() throws {
    XCTAssertEqual(5, Ammo.arrows.cost)
  }

  func test_AmmoEnum_cost_crossbowBolts_shouldBeEqual() throws {
    XCTAssertEqual(10, Ammo.crossbowBolts.cost)
  }

  func test_AmmoEnum_cost_silverTippedArrow_shouldBeEqual() throws {
    XCTAssertEqual(5, Ammo.silverTippedArrow.cost)
  }

  func test_AmmoEnum_cost_slingStones_shouldBeEqual() throws {
    XCTAssertEqual(0, Ammo.slingStones.cost)
  }

  // image name
  func test_AmmoEnum_imgName_arrows_shouldBeEqual() throws {
    XCTAssertEqual("amArrows", Ammo.arrows.imgName)
  }

  func test_AmmoEnum_imgName_crossbowBolts_shouldBeEqual() throws {
    XCTAssertEqual("amCrossbowBolt", Ammo.crossbowBolts.imgName)
  }

  func test_AmmoEnum_imgName_silverTippedArrow_shouldBeEqual() throws {
    XCTAssertEqual("amSilverTippedArrow", Ammo.silverTippedArrow.imgName)
  }

  func test_AmmoEnum_imgName_slingStones_shouldBeEqual() throws {
    XCTAssertEqual("amSlingStones", Ammo.slingStones.imgName)
  }
}
