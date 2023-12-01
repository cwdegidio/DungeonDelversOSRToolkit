//
//  OnBoardingTemplate.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/30/23.
//

import SwiftUI

struct OnBoardingTemplate: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  let image: String
  let content: String
  let showCompletionButton: Bool
  @Binding var showOnBoarding: Bool

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)
    let layout = portrait ?
    AnyLayout(VStackLayout()) :
    AnyLayout(HStackLayout())

    layout {
      Text("Dungeon Delver's OSR Toolkit")
        .font(.title)
        .fontWeight(.black)
        .foregroundStyle(Color("tkRed"))
        .frame(alignment: .center)
        .multilineTextAlignment(portrait ? .center : .trailing)
      ZStack {
        Image(image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 300, height: 300)
          .padding(.bottom)
        Rectangle()
          .stroke(lineWidth: 5.0)
          .frame(width: 300, height: 300)
          .padding(.bottom)
      }
      Text(content)
        .font(.title3)
        .fontWeight(.bold)
        .frame(maxWidth: 300)
      Spacer()
      if showCompletionButton {
        LargeButton(label: "Continue to the Toolkit!", isDisabled: false) {
          showOnBoarding = false
        }
        .offset(x: 0, y: -30)
        .padding()
      }
    }
  }
}

#Preview {
  OnBoardingTemplate(
    image: "NoBooks",
    content: "Stop flipping through countless pages to create a character.",
    showCompletionButton: true,
    showOnBoarding: .constant(false)
  )
}
