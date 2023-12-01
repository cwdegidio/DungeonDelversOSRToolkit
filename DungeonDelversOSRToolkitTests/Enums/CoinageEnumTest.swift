//
//  CoinageEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class CoinageEnumTest: XCTestCase {
  // Short Name
  func test_CoinageEnumTest_shortName_Platinum_shouldBeEqual() throws {
    XCTAssertEqual("pp", Coinage.platinumPieces.shortName)
  }

  func test_CoinageEnumTest_shortName_Gold_shouldBeEqual() throws {
    XCTAssertEqual("gp", Coinage.goldPieces.shortName)
  }

  func test_CoinageEnumTest_shortName_Electrum_shouldBeEqual() throws {
    XCTAssertEqual("ep", Coinage.electrumPieces.shortName)
  }

  func test_CoinageEnumTest_shortName_Silver_shouldBeEqual() throws {
    XCTAssertEqual("sp", Coinage.silverPieces.shortName)
  }

  func test_CoinageEnumTest_shortName_Copper_shouldBeEqual() throws {
    XCTAssertEqual("cp", Coinage.copperPieces.shortName)
  }

  // Name
  func test_CoinageEnumTest_name_Platinum_shouldBeEqual() throws {
    XCTAssertEqual("platinum pieces", Coinage.platinumPieces.name)
  }

  func test_CoinageEnumTest_name_Gold_shouldBeEqual() throws {
    XCTAssertEqual("gold pieces", Coinage.goldPieces.name)
  }

  func test_CoinageEnumTest_name_Electrum_shouldBeEqual() throws {
    XCTAssertEqual("electrum pieces", Coinage.electrumPieces.name)
  }

  func test_CoinageEnumTest_name_Silver_shouldBeEqual() throws {
    XCTAssertEqual("silver pieces", Coinage.silverPieces.name)
  }

  func test_CoinageEnumTest_name_Copper_shouldBeEqual() throws {
    XCTAssertEqual("copper pieces", Coinage.copperPieces.name)
  }
}
