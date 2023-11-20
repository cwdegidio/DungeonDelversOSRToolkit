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
  let rectangleCornerSize = CGSize(width: 10, height: 10)
  let rectangleStrokeWidth = CGFloat(5)
  let rectangleFrame = CGFloat(30)
  let symbolFrame = CGFloat(15)

  var body: some View {
    Button {
      action()
    } label: {
      ZStack {
        RoundedRectangle(cornerSize: rectangleCornerSize)
          .stroke(isDisabled ? Color("tkDisabledStroke") : Color.black, lineWidth: rectangleStrokeWidth)
          .fill(isDisabled ? Color.gray : color)
          .frame(width: rectangleFrame, height: rectangleFrame)
        Image(systemName: symbolName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: symbolFrame, height: symbolFrame)
          .foregroundStyle(isDisabled ? Color("tkDisabledStroke") : Color.black)
      }
    }
    .disabled(isDisabled)
  }
}

extension Button {
  func largeButtonStyle() -> some View {
    let rectangleCornerSize = CGSize(width: 10, height: 5)
    let padding = CGFloat(8)

    return self
      .padding(.vertical, padding)
      .frame(maxWidth: .infinity)
      .background(Color("tkRed"))
      .clipShape(RoundedRectangle(cornerSize: rectangleCornerSize))
  }

  func smallButtonStyle(bgColor: Color) -> some View {
    let rectangleCornerSize = CGSize(width: 10, height: 5)
    let padding = CGFloat(5)
    let rectangleStrokeWidth = CGFloat(2)

    return self
      .padding(.vertical, padding)
      .frame(maxWidth: .infinity)
      .background(bgColor)
      .clipShape(RoundedRectangle(cornerSize: rectangleCornerSize))
      .overlay(
        RoundedRectangle(cornerSize: rectangleCornerSize)
          .stroke(Color.blue, lineWidth: rectangleStrokeWidth)
      )
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
