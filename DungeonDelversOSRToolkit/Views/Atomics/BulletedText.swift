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
        .font(Font.custom("Courier", size: 21))
        .baselineOffset(-2)
      Text(markdownString)
    }
    .padding(.bottom, 5)
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
