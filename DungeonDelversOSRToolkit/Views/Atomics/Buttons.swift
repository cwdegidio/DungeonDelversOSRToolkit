//
//  Buttons.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct LargeButton: View {
  var label: String
  var isDisabled: Bool
  var action: () -> Void
  let rectangleCornerSize = CGSize(width: 10, height: 10)
  let padding = CGFloat(8)

  var body: some View {
    Button(action: action) {
      Text(label)
        .frame(maxWidth: .infinity)
        .padding(.vertical, padding)
        .background(isDisabled ? Color.gray : Color("tkRed"))
        .foregroundStyle(isDisabled ? Color.black.opacity(0.4) : Color.white)
        .clipShape(RoundedRectangle(cornerSize: rectangleCornerSize))
    }
    .disabled(isDisabled)
  }
}

struct SmallButton: View {
  var label: String
  var icon: String
  var bgColor: Color
  var isDisabled: Bool
  var action: () -> Void
  let padding = CGFloat(5)
  let rectangleCornerSize = CGSize(width: 5, height: 5)

  var body: some View {
    Button(action: action) {
      buttonLabel
        .frame(maxWidth: .infinity)
        .padding(.vertical, padding)
        .background(isDisabled ? Color.gray : bgColor)
        .clipShape(RoundedRectangle(cornerSize: rectangleCornerSize))
    }
    .disabled(isDisabled)
  }

  var buttonLabel: some View {
    HStack {
      Image(systemName: icon)
        .foregroundStyle(isDisabled ? Color.black.opacity(0.4) : Color.white)
        .imageScale(.small)
      Text(label)
        .foregroundStyle(isDisabled ? Color.black.opacity(0.4) : Color.white)
    }
  }
}

struct AdjustmentButton: View {
  var symbolName: String
  var color: Color
  var isDisabled: Bool
  var action: () -> Void
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
          .stroke(Color.black, lineWidth: rectangleStrokeWidth)
          .fill(isDisabled ? Color.gray : color)
          .frame(width: rectangleFrame, height: rectangleFrame)
        Image(systemName: symbolName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: symbolFrame, height: symbolFrame)
          .foregroundStyle(isDisabled ? Color.black.opacity(0.4) : Color.black)
      }
    }
    .disabled(isDisabled)
  }
}


#Preview("Large Button Enabled") {
  LargeButton(label: "Reroll All Abilities", isDisabled: false) {
    print("test")
  }
}

#Preview("Large Button Disabled") {
  LargeButton(label: "Reroll All Abilities", isDisabled: true) {
    print("test")
  }
}

#Preview("Small Button Enabled") {
  SmallButton(label: "Reroll", icon: "dice.fill", bgColor: Color("tkBlue"), isDisabled: false) {
    print("test")
  }
}

#Preview("Small Button Disaled") {
  SmallButton(label: "Reroll", icon: "dice.fill", bgColor: Color("tkBlue"), isDisabled: true) {
    print("test")
  }
}

#Preview("Adjustment Button Enabled") {
  AdjustmentButton(symbolName: "plus", color: Color("tkBlue"), isDisabled: false) {
    print("test")
  }
}

#Preview("Adjustment Button Disabled") {
  AdjustmentButton(symbolName: "plus", color: Color("tkBlue"), isDisabled: true) {
    print("test")
  }
}
