//
//  OrientationHelperTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/20/23.
//

import XCTest
import SwiftUI
@testable import DungeonDelversOSRToolkit

final class OrientationHelperTest: XCTestCase {
  func test_OrientationHelper_isPortriat_shouldBeTrue() throws {
    let hClass: UserInterfaceSizeClass = .compact
    let vClass: UserInterfaceSizeClass = .regular

    XCTAssertTrue(OrientationHelper.isPortrait(hClass: hClass, vClass: vClass))
  }

  func test_OrientationHelper_isPortriat_shouldBeFalse() throws {
    let hClass: UserInterfaceSizeClass = .regular
    let vClass: UserInterfaceSizeClass = .compact

    XCTAssertFalse(OrientationHelper.isPortrait(hClass: hClass, vClass: vClass))
  }
}
