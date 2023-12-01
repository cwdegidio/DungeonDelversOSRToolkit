//
//  CharacterModTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class CharacterModTest: XCTestCase {
  func test_CharacterModModel_init_shouldBeEqual() throws {
    let mod = CharacterMod(modType: .armorClass, asscStat: .dex)
    XCTAssertEqual(Mod.armorClass, mod.modType)
    XCTAssertEqual(Stat.dex, mod.asscStat)
  }
}
