//
//  Abilities.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct Abilities: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  @State private var showSheet = false
  @State private var currentCharacterAbility: Ability = CharacterAbility(statType: .str, score: 0)
  @State private var abilityScore = 0
  @State private var abilityTitle = "Let's Roll!"
  @State private var statsRolled = false
  let viewModel = AbilityViewModel()
  let landscapePadding = CGFloat(100)

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

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
        } else {
          AbilityPresentationLandscape(
            abilityTitle: $abilityTitle,
            abilityScore: $abilityScore,
            currentCharacterAbility: $currentCharacterAbility,
            showSheet: $showSheet,
            statsRolled: $statsRolled,
            player: player,
            viewModel: viewModel
          )
          .padding(.top, landscapePadding)
        }
        Spacer()
        AbilityStatBlockItems(
          currentCharacterAbility: $currentCharacterAbility,
          abilityScore: $abilityScore,
          abilityTitle: $abilityTitle,
          player: player
        )
        .offset(x: 0, y: -20)
        Spacer()
        LargeButton(label: "Next Step: Select Class", isDisabled: !statsRolled) {
          nextScreen()
        }
        .padding(.horizontal)
        .padding(.bottom, 20)
      }
      .padding(.bottom, portrait ? 0 : 100)
    }
  }

  func nextScreen() {
    screen.currentScreen = Screen.classSelection
  }
}

#Preview {
  Abilities()
    .environment(PlayerCharacter())
}
