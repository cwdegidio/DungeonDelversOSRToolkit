//
//  Typography.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

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

struct AbilityScoreFlourish: View {
  let content: Int

  var body: some View {
    Text("\(content)")
      .font(Font.custom("Handlee-Regular", size: 96))
  }
}

struct Subtitle: View {
  let content: String

  var body: some View {
    Text(content)
      .font(.system(size: 28.0))
      .fontWeight(.bold)
  }
}

#Preview("Instruction") {
  Instruction(content: "Tap ability to view modifiers or reroll score.")
}

#Preview("Ability Title") {
  AbilityTitle(content: "Strength")
}

#Preview("Ability Score Flourish") {
  AbilityScoreFlourish(content: 18)
}

#Preview("Subtitle") {
  Subtitle(content: "Modifiers")
}
