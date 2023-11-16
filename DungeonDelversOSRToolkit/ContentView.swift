//
//  ContentView.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var player = PlayerCharacter()
  @StateObject var screen = ApplicationScreen(currentScreen: .abilities)

  var body: some View {
    switch screen.currentScreen {
    case .abilities:
      Abilities()
        .environment(player)
        .environment(screen)
      //    case .classSelection:
      //      ClassSelection()
      //        .environment(pc)
      //        .environment(screen)
      //    case .abilityAdjustment:
      //      AbilityAdjustments()
      //        .environment(pc)
      //        .environment(screen)
    }
  }
}

#Preview {
  ContentView()
}
