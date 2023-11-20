//
//  AbilityAdjustment.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/18/23.
//

import SwiftUI

struct AbilityAdjustment: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  @State private var pointsPool = 0
  @State private var currentPrimeReqBonus = 0
  @State var tempStatsScores: [Ability] = []
  let modCalculator = ModCalculator()
  let viewModel = AbilityAdjustmentViewModel()
  var xpAdjustment: Int {
    modCalculator.calculateXPAdjustment(for: player)
  }

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

    ZStack {
      GlobalBackground()
      VStack {
        if portrait {
          AbilityAdjustmentPresentationPortrait(
            pointsPool: $pointsPool,
            tempStatsScores: $tempStatsScores,
            modCalculator: modCalculator,
            viewModel: viewModel
          )
        } else {
          AbilityAdjustmentPresentationLandscape(
            pointsPool: $pointsPool,
            tempStatsScores: $tempStatsScores,
            modCalculator: modCalculator,
            viewModel: viewModel
          )
        }

        Spacer()
        LargeButton(label: "Next Step: Select Class") {
          screen.currentScreen = Screen.characterDetails
        }
        .padding(.horizontal)
        .padding(.bottom)
      }
    }
    .onAppear {
      tempStatsScores = player.abilityScores
    }
  }

  func nextScreen() {
    screen.currentScreen = Screen.classSelection
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
  player.characterClass = CharacterClass.thief
  return AbilityAdjustment()
    .environment(player)
}
