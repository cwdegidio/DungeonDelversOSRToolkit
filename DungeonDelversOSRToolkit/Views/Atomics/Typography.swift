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

struct AbilityDetailTitle: View {
  let content: String

  var body: some View {
    Text(content)
      .font(.system(size: 32.0))
      .fontWeight(.bold)
  }
}

struct AbilityScoreFlourish: View {
  let content: Int

  var body: some View {
    Text("\(content)")
      .font(.system(size: 96.0, design: .rounded))
  }
}

struct Subtitle: View {
  let content: String

  var body: some View {
    Text(content)
      .font(.system(size: 21.0))
      .fontWeight(.bold)
  }
}

#Preview("Instruction") {
  Instruction(content: "Tap ability to view modifiers or reroll score.")
}

#Preview("Ability Title") {
  AbilityTitle(content: "Strength")
}

#Preview("Ability Detail Title") {
  AbilityDetailTitle(content: "Strength")
}

#Preview("Ability Score Flourish") {
  AbilityScoreFlourish(content: 18)
}

#Preview("Subtitle") {
  Subtitle(content: "Modifiers")
}
