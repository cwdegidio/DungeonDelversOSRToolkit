//
//  OnBoardingMain.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/30/23.
//

import SwiftUI

struct OnBoardingMain: View {
  @Binding var showOnboarding: Bool

  var body: some View {
    VStack {
      TabView {
        OnBoardingTemplate(
          image: "NoBooks",
          content: "Stop flipping through countless pages to create a character.",
          showCompletionButton: false,
          showOnBoarding: $showOnboarding
        )
        OnBoardingTemplate(
          image: "CreateQuickly",
          content: "Create new heroes as fast as you can imagine them and get back to the game!",
          showCompletionButton: false,
          showOnBoarding: $showOnboarding
        )
        OnBoardingTemplate(
          image: "SaveLocal",
          content: "Save your new heroes to your phone for fast access during the game.",
          showCompletionButton: false,
          showOnBoarding: $showOnboarding
        )
        OnBoardingTemplate(
          image: "SaveCloud",
          content: "Share your favorite characters with the Dungeon Delver's Dragon Cloud community.",
          showCompletionButton: false,
          showOnBoarding: $showOnboarding
        )
        OnBoardingTemplate(
          image: "FunWithFriends",
          content: "Get back in the action quickly and enjoy creating epic tales with friends!",
          showCompletionButton: true,
          showOnBoarding: $showOnboarding
        )
      }
      .tabViewStyle(PageTabViewStyle())
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color("tkGreen"))
  }
}

#Preview {
  OnBoardingMain(showOnboarding: .constant(true))
}
