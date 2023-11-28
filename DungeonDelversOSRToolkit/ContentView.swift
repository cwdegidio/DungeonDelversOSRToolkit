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
  @StateObject var review = ReviewModel()

  var body: some View {
    switch screen.currentScreen {
    case .home:
      Home()
        .environmentObject(screen)
    case .localCharacterVault:
      LocalCharacterVault()
        .environmentObject(review)
        .environmentObject(screen)
    case .cloudCharacterVault:
      CloudCharacterVault()
        .environmentObject(review)
        .environmentObject(screen)
    case .characterManagementReview:
      CharacterManagementReview()
        .environmentObject(review)
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
      NewCharacterReview()
        .environmentObject(player)
        .environmentObject(screen)
    case .characterSave:
      CharacterSave()
        .environmentObject(player)
        .environmentObject(screen)
    default:
      Home()
        .environmentObject(screen)
    }
  }
}

#Preview {
  ContentView()
}
