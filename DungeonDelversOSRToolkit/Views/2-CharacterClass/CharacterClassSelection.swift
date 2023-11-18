//
//  CharacterClassSelection.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/17/23.
//

import SwiftUI

class PageViewModel: ObservableObject {
/*
Every time selectTabIndex changes, it will notify the
consuming SwiftUI view which in return will update
*/
  @Published var selectTabIndex = 0
}

struct CharacterClassSelection: View {
  @Environment(\.verticalSizeClass)
  var verticalSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var horizontalSizeClass: UserInterfaceSizeClass?
  @StateObject var pageViewModel = PageViewModel()
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  @State private var index = 0
  @State private var allowedClasses: [CharacterClass] = []
  @State private var showSheet = false
  @State private var currentIndex = 0
  let viewModel = CharacterClassSelectionViewModel()

  var body: some View {
    let portrait = horizontalSizeClass == .compact && verticalSizeClass == .regular
    let landscape = horizontalSizeClass == .compact && verticalSizeClass == .compact ||
    horizontalSizeClass == .regular && verticalSizeClass == .compact

    ZStack {
      GlobalBackground()
      VStack {
        TabView(selection: $pageViewModel.selectTabIndex) {
          ForEach(0..<allowedClasses.count, id: \.self) { _ in
            if portrait {
              CharacterCarouselPortrait(
                showSheet: $showSheet,
                thisClass: allowedClasses[currentIndex],
                viewModel: viewModel
              )
            } else if landscape {
              CharacterCarouselLandscape(
                showSheet: $showSheet,
                thisClass: allowedClasses[currentIndex],
                viewModel: viewModel
              )
            }
          }
          .padding(.bottom, portrait ? 0 : 40)
        }
        .onReceive(pageViewModel.$selectTabIndex) { idx in
          // This feels like a total hack but it solves the
          // TabView double index update issue.
          currentIndex = Int(idx.description) ?? 0
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(maxHeight: .infinity)
        .padding(.top, portrait ? -30 : 0)
        Spacer()
        LargeButton(label: "Next Step: Ability Adjustment") {
          // TODO: Update NExt Screen Action
          print("test")
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
      }
    }
    .onAppear {
      for charClass in CharacterClass.allCases where viewModel.meetsClassRequirement(for: charClass, using: player) {
        allowedClasses.append(charClass)
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
  return CharacterClassSelection()
    .environment(player)
}
