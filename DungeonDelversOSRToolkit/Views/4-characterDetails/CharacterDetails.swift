//
//  CharacterDetails.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/19/23.
//

import SwiftUI

struct CharacterDetails: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  @State var hpRolled = false

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

    ZStack {
      GlobalBackground()
      if portrait {
        CharacterDetailsPresentationPortrait(hpRolled: $hpRolled)
      } else {
        CharacterDetailsPresentationLandscape(hpRolled: $hpRolled)
      }
    }
  }
}

#Preview {
  let player = PlayerCharacter()
  player.abilityScores = [
    CharacterAbility(statType: .str, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
  ]
  player.characterClass = CharacterClass.fighter
  return CharacterDetails()
    .environment(player)
}
