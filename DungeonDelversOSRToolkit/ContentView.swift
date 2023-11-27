//
//  ContentView.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject var player = PlayerCharacter()
  @StateObject var screen = ApplicationScreen(currentScreen: .home)

  var body: some View {
    switch screen.currentScreen {
    case .home:
      Home()
        .environment(screen)
    case .localCharacterVault:
      LocalCharacterVault()
        .environmentObject(player)
        .environmentObject(screen)
    case .abilities:
      Abilities()
        .environmentObject(player)
        .environmentObject(screen)
    case .classSelection:
      CharacterClassSelection()
        .environmentObject(player)
        .environmentObject(screen)
    case .abilityAdjustment:
      AbilityAdjustment()
        .environmentObject(player)
        .environmentObject(screen)
    case .characterDetails:
      CharacterDetails()
        .environmentObject(player)
        .environmentObject(screen)
    case .characterBio:
      CharacterBio()
        .environmentObject(player)
        .environmentObject(screen)
    case .spells:
      Spells()
        .environmentObject(player)
        .environmentObject(screen)
    case .equipment:
      Equipment()
        .environmentObject(player)
        .environmentObject(screen)
    case .characterReview:
      CharacterReview()
        .environmentObject(player)
        .environmentObject(screen)
    case .characterSave:
      CharacterSave()
        .environmentObject(player)
        .environmentObject(screen)
    }
  }
}

#Preview {
  ContentView()
}
