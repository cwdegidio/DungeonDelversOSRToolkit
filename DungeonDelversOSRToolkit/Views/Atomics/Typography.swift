//
//  Typography.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct Typography: View {
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct Instruction: View {
  let content: String

  var body: some View {
    Text(content)
      .font(.callout)
  }
}

struct AbilityTitle: View {
  let content: String

  var body: some View {
    Text(content)
      .font(.system(size: 40.0))
      .fontWeight(.bold)
  }
}

#Preview {
  Group {
    Typography()
    Instruction(content: "Tap ability to view modifiers or reroll score.")
    AbilityTitle(content: "Strength")
  }
}
