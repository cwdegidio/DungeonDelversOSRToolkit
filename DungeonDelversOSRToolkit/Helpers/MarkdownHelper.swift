//
//  MarkdownHelper.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/20/23.
//

import SwiftUI

enum MarkdownHelper {
  static func returnMarkdown(for value: String) -> AttributedString? {
    do {
      let thisString = try AttributedString(markdown: value)
      return thisString
    } catch {
      print("error")
    }
    return nil
  }
}
