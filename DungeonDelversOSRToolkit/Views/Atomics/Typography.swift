//
//  Typography.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct Instruction: View {
  let content: String
  let lineLimit = 3

  var body: some View {
    Text(content)
      .lineLimit(lineLimit)
      .font(.callout)
  }
}

struct AbilityTitle: View {
  let content: String
  let size = CGFloat(40)

  var body: some View {
    Text(content)
      .font(.system(size: size))
      .fontWeight(.bold)
  }
}

struct AbilitySubtitle: View {
  let content: String
  let size = CGFloat(32)

  var body: some View {
    Text(content)
      .font(.system(size: size))
      .fontWeight(.bold)
  }
}

struct AbilityDetailTitle: View {
  let content: String
  let size = CGFloat(32)

  var body: some View {
    Text(content)
      .font(.system(size: size))
      .fontWeight(.bold)
  }
}

struct AbilityScoreFlourish: View {
  let content: Int
  let size = CGFloat(96)

  var body: some View {
    Text("\(content)")
      .font(.system(size: size, design: .rounded))
  }
}

struct AbilityAdjustmentFlourish: View {
  let content: String
  let size = CGFloat(72)

  var body: some View {
    Text("\(content)")
      .font(.system(size: size, design: .rounded))
  }
}

struct Subtitle: View {
  let content: String
  let size = CGFloat(21)

  var body: some View {
    Text(content)
      .font(.system(size: size))
      .fontWeight(.bold)
  }
}

#Preview("Instruction") {
  Instruction(content: "Tap ability to view modifiers or reroll score. Tap ability to view modifiers or reroll score.")
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
