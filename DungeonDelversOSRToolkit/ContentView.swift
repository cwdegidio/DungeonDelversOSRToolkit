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
    case .classSelection:
      CharacterClassSelection()
        .environment(player)
        .environment(screen)
    case .abilityAdjustment:
      AbilityAdjustment()
        .environment(player)
        .environment(screen)
    case .characterDetails:
      CharacterDetails()
        .environment(player)
        .environment(screen)
    case .characterBio:
      CharacterBio()
        .environment(player)
        .environment(screen)
    case .spells:
      Spells()
        .environment(player)
        .environment(screen)
    case .equipment:
      Equipment()
        .environment(player)
        .environment(screen)
    }
  }
}

#Preview {
  ContentView()
}
