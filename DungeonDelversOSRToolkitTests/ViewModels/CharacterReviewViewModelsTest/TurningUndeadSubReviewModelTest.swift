//
//  TurningUndeadSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class TurningUndeadSubReviewModelTest: XCTestCase {
  func test_TurningUndeadSubReviewModel_getClericTurning() throws {
    let viewModel = TurningUndeadSubReviewModel()
    let turning: KeyValuePairs<String, String> = [
      "1": "7",
      "2": "9",
      "2*": "11",
      "3": "-",
      "4": "-",
      "5": "-",
      "6": "-",
      "7-9": "-"
    ]
    let data = viewModel.getClericTurning()

    for i in 0..<turning.count {
      XCTAssertEqual(turning[i].key, data[i].key)
      XCTAssertEqual(turning[i].value, data[i].value)
    }
  }
}
