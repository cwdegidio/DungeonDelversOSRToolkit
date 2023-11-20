//
//  GlobalBackground.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct GlobalBackground: View {
  let overlayOpacity = 0.05

  var body: some View {
    ZStack {
      Rectangle()
        .fill(.white)
        .ignoresSafeArea()
      Image("tkBackground")
        .resizable(resizingMode: .tile)
        .ignoresSafeArea()
      Image("tkBackgroundOverlay")
        .resizable(resizingMode: .tile)
        .ignoresSafeArea()
        .opacity(overlayOpacity)
    }
  }
}

#Preview {
  GlobalBackground()
}
