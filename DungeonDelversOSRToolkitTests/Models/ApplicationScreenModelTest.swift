//
//  ApplicationScreenModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ApplicationScreenModelTest: XCTestCase {
  func test_ApplicationScreenModel_init_shouldBeEqual() throws {
    let screen = ApplicationScreen(currentScreen: .abilities)

    XCTAssertEqual(Screen.abilities, screen.currentScreen)
  }
}
