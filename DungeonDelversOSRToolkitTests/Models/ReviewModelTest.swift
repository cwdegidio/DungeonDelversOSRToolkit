//
//  ReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ReviewModelTest: XCTestCase {
  func test_ReviewModel_init_shouldBeEqual() throws {
    let reviewModel = ReviewModel()
    XCTAssertNil(reviewModel.currentCharacter)
  }
}
