//
//  MarkdownHelperTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class MarkdownHelperTest: XCTestCase {
  func test_returnMarkdown_shouldBeNil() throws {
    XCTAssertEqual(try AttributedString(markdown: "test"), MarkdownHelper.returnMarkdown(for: "test"))
  }
}
