//
//  BulletedText.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/16/23.
//

import SwiftUI

struct BulletedText: View {
  var content: String
  private var markdownString: AttributedString
  let bulletSize = CGFloat(21)
  let bulletBaselineOffset = CGFloat(-2)
  let itemPadding = CGFloat(5)

  init(content: String) {
    self.content = content

    do {
      let convertedString = try AttributedString(markdown: content)
      markdownString = convertedString
    } catch {
      markdownString = "Error parsing string"
    }
  }

  var body: some View {
    HStack(alignment: .top) {
      Text("•")
        .font(Font.custom("Courier", size: bulletSize))
        .baselineOffset(bulletBaselineOffset)
      Text(markdownString)
    }
    .padding(.bottom, itemPadding)
  }
}

#Preview {
  VStack(alignment: .leading) {
    let longString = "**Turn Undead:** Clerics can invoke the power " +
    "of their deity to repel undead monsters encountered."

    let shortString = "**Holy Symbol:** a holy symbol"

    BulletedText(content: longString)
    BulletedText(content: shortString)
  }
}
