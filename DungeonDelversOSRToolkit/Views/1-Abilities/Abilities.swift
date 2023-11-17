//
//  Abilities.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct Abilities: View {
  @Environment(\.verticalSizeClass)
  var verticalSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var horizontalSizeClass: UserInterfaceSizeClass?

  @EnvironmentObject var player: PlayerCharacter

  @State private var showSheet = false
  @State private var currentCharacterAbility: Ability = CharacterAbility(statType: .str, score: 0)
  @State private var abilityScore = 0
  @State private var abilityTitle = "Let's Roll!"
  @State private var statsRolled = false
  let viewModel = AbilityViewModel()

  var body: some View {
    let portrait = horizontalSizeClass == .compact && verticalSizeClass == .regular
    let landscape = horizontalSizeClass == .compact && verticalSizeClass == .compact ||
    horizontalSizeClass == .regular && verticalSizeClass == .compact

    ZStack {
      GlobalBackground()
      VStack {
        Spacer()
        if portrait {
          AbilityPresentationPortrait(
            abilityTitle: $abilityTitle,
            abilityScore: $abilityScore,
            currentCharacterAbility: $currentCharacterAbility,
            showSheet: $showSheet,
            statsRolled: $statsRolled,
            player: player,
            viewModel: viewModel
          )
        }

        if landscape {
          AbilityPresentationLandscape(
            abilityTitle: $abilityTitle,
            abilityScore: $abilityScore,
            currentCharacterAbility: $currentCharacterAbility,
            showSheet: $showSheet,
            statsRolled: $statsRolled,
            player: player,
            viewModel: viewModel
          )
            .padding(.top, 100)
        }

        Spacer()
        AbilityStatBlockItems(
          currentCharacterAbility: $currentCharacterAbility,
          abilityScore: $abilityScore,
          abilityTitle: $abilityTitle,
          player: player,
          horizontalSizeClass: horizontalSizeClass ?? .regular,
          verticalSizeClass: verticalSizeClass ?? .regular
        )
      }
    }
  }
}

#Preview {
  Abilities()
    .environment(PlayerCharacter())
}
