//
//  ContainerView.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/30/23.
//

import SwiftUI

struct ContainerView: View {
  @AppStorage("_showOnBoarding")
  var showOnBoarding = true
  @State private var isSplashPresented = true
  var body: some View {
    if !isSplashPresented {
      ContentView()
        .fullScreenCover(isPresented: $showOnBoarding) {
          OnBoardingMain(showOnboarding: $showOnBoarding)
        }
    } else {
      SplashScreen(isPresented: $isSplashPresented)
    }
  }
}

#Preview {
  ContainerView()
}
