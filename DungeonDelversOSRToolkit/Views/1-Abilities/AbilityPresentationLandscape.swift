//
//  AbilityPresentationLandscape.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct AbilityPresentationLandscape: View {
  @Binding var abilityTitle: String
  @Binding var abilityScore: Int
  @Binding var currentCharacterAbility: Ability
  @Binding var showSheet: Bool
  @Binding var statsRolled: Bool
  var player: PlayerCharacter
  var viewModel: AbilityViewModel

  var body: some View {
    HStack {
      AbilityLandscapeFlourish(abilityScore: abilityScore, abilityTitle: abilityTitle)
      Spacer()
      VStack {
        HStack {
          SmallButton(
            label: "Modifiers",
            icon: "plus.forwardslash.minus",
            bgColor: statsRolled ? Color("tkBlue") : Color.gray,
            fgColor: statsRolled ? Color.white : Color(red: 0.75, green: 0.75, blue: 0.75)
          ) {
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
            bgColor: statsRolled ? Color("tkBlue") : Color.gray,
            fgColor: statsRolled ? Color.white : Color(red: 0.75, green: 0.75, blue: 0.75)
          ) {
            viewModel.setSingleAbilityScore(for: player, onAbility: currentCharacterAbility.statType)
            abilityScore = currentCharacterAbility.score
          }
        }
        .padding(.bottom, 10)
        SmallButton(
          label: "Roll All Abilities",
          icon: "dice.fill",
          bgColor: Color("tkRed"),
          fgColor: nil
        ) {
          statsRolled = true
          viewModel.setAllAbilityScores(for: player)
          abilityScore = currentCharacterAbility.score
          if let currentAbility = player.abilityScores.first {
            currentCharacterAbility = currentAbility
            abilityScore = currentAbility.score
            abilityTitle = currentAbility.statType.name
          }
        }
      }
    }
    .padding(.horizontal, 20)
  }

  func displaySheet() {
    showSheet.toggle()
  }
}

#Preview {
  AbilityPresentationLandscape(
    abilityTitle: .constant("Strength"),
    abilityScore: .constant(18),
    currentCharacterAbility: .constant(CharacterAbility(statType: .str, score: 18)),
    showSheet: .constant(false),
    statsRolled: .constant(false),
    player: PlayerCharacter(),
    viewModel: AbilityViewModel()
  )
}
