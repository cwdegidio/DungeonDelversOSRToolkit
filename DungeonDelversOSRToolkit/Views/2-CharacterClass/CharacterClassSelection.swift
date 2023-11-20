//
//  CharacterClassSelection.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/17/23.
//

import SwiftUI

struct CharacterClassSelection: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @StateObject var indexPublisher = IndexPublisher()
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  @State private var index = 0
  @State private var allowedClasses: [CharacterClass] = []
  @State private var showSheet = false
  @State private var currentIndex = 0
  let viewModel = CharacterClassSelectionViewModel()
  let carouselLandscapePadding = CGFloat(40)
  let carouselPortraitPadding = CGFloat(-30)

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

    ZStack {
      GlobalBackground()
      VStack {
        TabView(selection: $indexPublisher.selectTabIndex) {
          ForEach(0..<allowedClasses.count, id: \.self) { _ in
            if portrait {
              CharacterCarouselPortrait(
                showSheet: $showSheet,
                thisClass: allowedClasses[currentIndex],
                viewModel: viewModel
              )
            } else {
              CharacterCarouselLandscape(
                showSheet: $showSheet,
                thisClass: allowedClasses[currentIndex],
                viewModel: viewModel
              )
            }
          }
          .padding(.bottom, portrait ? 0 : carouselLandscapePadding)
        }
        .onReceive(indexPublisher.$selectTabIndex) { idx in
          // This feels like a total hack but it solves the
          // TabView double index update issue.
          currentIndex = Int(idx.description) ?? 0
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(maxHeight: .infinity)
        .padding(.top, portrait ? carouselPortraitPadding : 0)
        Spacer()
        LargeButton(label: "Next Step: Ability Adjustment") {
          nextScreen()
        }
        .padding(.horizontal)
        .padding(.bottom)
      }
    }
    .onAppear {
      for charClass in CharacterClass.allCases where viewModel.meetsClassRequirement(for: charClass, using: player) {
        allowedClasses.append(charClass)
      }
    }
  }

  func nextScreen() {
    screen.currentScreen = Screen.abilityAdjustment
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
  return CharacterClassSelection()
    .environment(player)
}
