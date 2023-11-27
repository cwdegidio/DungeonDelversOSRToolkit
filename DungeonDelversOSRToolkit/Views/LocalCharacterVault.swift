//
//  LocalCharacterVault.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import SwiftUI

struct LocalCharacterVault: View {
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  let viewModel = LocalCharacterVaultViewModel()
  @State var localCharacters: [PlayerCharacter] = []

  var body: some View {
    ZStack {
      GlobalBackground()
      VStack {
        VStack {
          Image(systemName: "figure.fencing")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
          AbilityTitle(content: "Characters")
          ScrollView {
            ForEach(localCharacters.sorted { $0.name < $1.name }, id: \.id) { character in
              SmallButton(
                label: "\(character.name) (\(character.characterClass?.name ?? "No class"))",
                icon: "\(character.characterClass?.symbol ?? "person.fill")",
                bgColor: Color("tkBlue"),
                fgColor: Color.white
              ) {
                
                screen.currentScreen = .characterReview
              }
              .padding(.bottom, 10)
            }
          }
        }
        LargeButton(label: "Return Home") {
          screen.currentScreen = .home
        }
      }
      .padding()
    }
    .onAppear {
      if localCharacters.isEmpty {
        guard let availableLocalCharacters = viewModel.getLocalCharacters() else {
          localCharacters = []
          return
        }

        localCharacters = availableLocalCharacters
      }
    }
  }
}

#Preview {
  let player1 = PlayerCharacter()
  player1.name = "Bob"
  player1.characterClass = .cleric
  let player2 = PlayerCharacter()
  player2.name = "Grimlock the Destroyer"
  player2.characterClass = .dwarf
  let player3 = PlayerCharacter()
  player3.name = "Conan the Conquerer"
  player3.characterClass = .fighter
  let localCharacters = [player1, player2, player3]
  return LocalCharacterVault(localCharacters: localCharacters)
}
