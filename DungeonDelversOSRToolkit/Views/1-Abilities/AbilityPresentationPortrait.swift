//
//  AbilityPresentationPortrait.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct AbilityPresentationPortrait: View {
  @Binding var abilityTitle: String
  @Binding var abilityScore: Int
  @Binding var currentCharacterAbility: Ability
  @Binding var showSheet: Bool
  var player: PlayerCharacter
  var viewModel: AbilityViewModel

  var body: some View {
    VStack {
      AbilityPortraitFlourish(abilityScore: abilityScore, abilityTitle: abilityTitle)
        .padding(.bottom)
      HStack {
        SmallButton(label: "Modifiers", icon: "plus.forwardslash.minus", bgColor: Color("tkBlue")) {
          displaySheet()
        }
        .sheet(isPresented: $showSheet) {
          AbilityDetailSheet(stat: currentCharacterAbility.statType)
            .presentationDragIndicator(.visible)
        }
        Spacer()
        SmallButton(
          label: "Reroll \(currentCharacterAbility.statType.shortName)",
          icon: "die.face.6.fill",
          bgColor: Color("tkBlue")
        ) {
          viewModel.setSingleAbilityScore(for: player, onAbility: currentCharacterAbility.statType)
          abilityScore = currentCharacterAbility.score
        }
      }
      .padding(.horizontal, 20)
      .padding(.top, -80)
      SmallButton(label: "Roll All Abilities", icon: "dice.fill", bgColor: Color("tkRed")) {
        viewModel.setAllAbilityScores(for: player)
        abilityScore = currentCharacterAbility.score
        if let currentAbility = player.abilityScores.first {
          currentCharacterAbility = currentAbility
          abilityScore = currentAbility.score
          abilityTitle = currentAbility.statType.name
        }
      }
      .padding(.horizontal, 20)
    }
  }

  func displaySheet() {
    showSheet.toggle()
  }
}

#Preview {
  AbilityPresentationPortrait(
    abilityTitle: .constant("Strength"),
    abilityScore: .constant(18),
    currentCharacterAbility: .constant(CharacterAbility(statType: .str, score: 18)),
    showSheet: .constant(false),
    player: PlayerCharacter(),
    viewModel: AbilityViewModel()
  )
}