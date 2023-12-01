//
//  AbilityStatBlockItems.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct AbilityStatBlockItems: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @Binding var currentCharacterAbility: Ability
  @Binding var abilityScore: Int
  @Binding var abilityTitle: String
  var player: PlayerCharacter
  let portraitPadding = CGFloat(50)
  let landscapePadding = CGFloat(100)
  let vGridSpacing = CGFloat(40)
  let hGridSpacing = CGFloat(20)
  let hGridItemSize = CGFloat(50)

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

    Group {
      if portrait {
        LazyVGrid(
          columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())],
          spacing: vGridSpacing
        ) {
          ForEach(player.abilityScores, id: \.statType) { stat in
            AbilityStatBlock(
              currentCharacterAbility: $currentCharacterAbility,
              abilityScore: $abilityScore,
              abilityTitle: $abilityTitle,
              stat: stat,
              score: stat.score,
              ability: stat.statType.shortName
            )
          }
        }
      } else {
        LazyVGrid(
          columns: [
            GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),
            GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
          ],
          spacing: hGridSpacing
        ) {
          ForEach(player.abilityScores, id: \.statType) { stat in
            AbilityStatBlock(
              currentCharacterAbility: $currentCharacterAbility,
              abilityScore: $abilityScore,
              abilityTitle: $abilityTitle,
              stat: stat,
              score: stat.score,
              ability: stat.statType.shortName
            )
          }
        }
      }
    }
  }
}

#Preview {
  let currentAbility = CharacterAbility(statType: .str, score: 18)
  let abilityScore = 18
  let abilityTitle = "Strength"
  let player = PlayerCharacter()

  return AbilityStatBlockItems(
    currentCharacterAbility: .constant(currentAbility),
    abilityScore: .constant(abilityScore),
    abilityTitle: .constant(abilityTitle),
    player: player
  )
}
