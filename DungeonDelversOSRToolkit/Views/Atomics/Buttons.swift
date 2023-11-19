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
  let fgColor: Color?
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
        .foregroundStyle(fgColor ?? Color.white)
        .imageScale(.small)
      Text(label)
        .foregroundStyle(fgColor ?? Color.white)
    }
  }
}

struct AdjustmentButton: View {
  let symbolName: String
  let color: Color
  let isDisabled: Bool
  let action: () -> Void

  var body: some View {
    Button {
      action()
    } label: {
      ZStack {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
          .stroke(isDisabled ? Color(red: 0.25, green: 0.25, blue: 0.25) : Color.black, lineWidth: 5)
          .fill(isDisabled ? Color.gray : color)
          .frame(width: 30, height: 30)
        Image(systemName: symbolName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 15, height: 15)
          .foregroundStyle(isDisabled ? Color(red: 0.25, green: 0.25, blue: 0.25) : Color.black)
      }
    }
    .disabled(isDisabled)
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
  SmallButton(label: "Reroll", icon: "dice.fill", bgColor: Color("tkBlue"), fgColor: nil) {}
}

#Preview("Adjustment Button") {
  VStack {
    AdjustmentButton(symbolName: "plus", color: Color("tkBlue"), isDisabled: false) {}
    AdjustmentButton(symbolName: "plus", color: Color("tkBlue"), isDisabled: true) {}
  }
}
