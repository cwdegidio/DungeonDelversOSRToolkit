//
//  ThievesSkillsSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class ThievesSkillsSubReviewModelTest: XCTestCase {
  func test_ThievesSkillsSubReviewModel_getThievesSkills_shouldBeEqual() throws {
    let viewModel = ThievesSkillsSubReviewModel()
    let skills: KeyValuePairs<String, Int> = [
      "CS": 87,
      "TR": 10,
      "HN": 2,
      "HS": 10,
      "MS": 20,
      "OL": 15,
      "PP": 20
    ]
    let data = viewModel.getThievesSkills()

    for i in 0..<skills.count {
      XCTAssertEqual(skills[i].key, data[i].key)
      XCTAssertEqual(skills[i].value, data[i].value)
    }
  }
}
