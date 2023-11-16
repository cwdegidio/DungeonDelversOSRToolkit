//
//  Buttons.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct LargeButton: View {
  let label: String
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(label)
        .foregroundStyle(Color.white)
    }
    .largeButtonStyle()
  }
}

struct SmallButton: View {
  let label: String
  let icon: String
  let bgColor: Color
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      buttonLabel
    }
    .smallButtonStyle(bgColor: bgColor)
  }

  var buttonLabel: some View {
    HStack {
      Image(systemName: icon)
        .foregroundStyle(Color.white)
        .imageScale(.small)
      Text(label)
        .foregroundStyle(Color.white)
    }
  }
}

extension Button {
  func largeButtonStyle() -> some View {
    self
      .padding([.top, .bottom], 8)
      .frame(maxWidth: .infinity)
      .background(Color("tkRed"))
      .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 5)))
  }

  func smallButtonStyle(bgColor: Color) -> some View {
    self
      .padding([.top, .bottom], 5)
      .frame(maxWidth: .infinity)
      .background(bgColor)
      .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 5)))
      .overlay(RoundedRectangle(cornerSize: CGSize(width: 10, height: 5))
        .stroke(Color.blue, lineWidth: 2))
  }
}

#Preview("Large Button") {
  LargeButton(label: "Reroll All Abilities") {}
}

#Preview("Small Button") {
  SmallButton(label: "Reroll", icon: "dice.fill", bgColor: Color("tkBlue")) {}
}
