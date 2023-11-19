//
//  AbilityAdjustment.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/18/23.
//

import SwiftUI

struct AbilityAdjustment: View {
  @Environment(\.verticalSizeClass)
  var verticalSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var horizontalSizeClass: UserInterfaceSizeClass?
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
    let portrait = horizontalSizeClass == .compact && verticalSizeClass == .regular
    let landscape = horizontalSizeClass == .compact && verticalSizeClass == .compact ||
    horizontalSizeClass == .regular && verticalSizeClass == .compact

    ZStack {
      GlobalBackground()
      VStack {
        if portrait {
          AbilityAdjustmentPresentationPortrait(
            modCalculator: modCalculator,
            viewModel: viewModel,
            pointsPool: $pointsPool,
            tempStatsScores: $tempStatsScores
          )
        }

        if landscape {
          AbilityAdjustmentPresentationLandscape(
            modCalculator: modCalculator,
            viewModel: viewModel,
            pointsPool: $pointsPool,
            tempStatsScores: $tempStatsScores
          )
        }

        Spacer()
        LargeButton(label: "Next Step: Select Class") {
          print("[ DEBUG ] ==== PLAYER STATS (Post Adjustment)====")
          for stat in player.abilityScores {
            print("[ DEBUG ] \(stat.statType.shortName): \(stat.score)")
          }
          screen.currentScreen = Screen.characterDetails
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
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
