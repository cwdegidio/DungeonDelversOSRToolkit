//
//  LocalCharacterVault.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import SwiftUI

struct LocalCharacterVault: View {
  @EnvironmentObject var review: ReviewModel
  @EnvironmentObject var screen: ApplicationScreen
  let viewModel = LocalCharacterVaultViewModel()
  @State var localCharacters: [PlayerCharacter] = []

  var body: some View {
    NavigationStack {
      ZStack {
        GlobalBackground()
        VStack {
          List {
            ScrollView {
              ForEach(localCharacters.sorted { $0.name < $1.name }, id: \.id) { character in
                VStack {
                  NavigationLink(destination: GeneralCharacterReview(player: character)) {
                    HStack {
                      Text("\(character.name) (\(character.characterClass?.name ?? "No class"))")
                      Spacer()
                      Image(systemName: "chevron.forward")
                    }
                  }
                  .padding()
                  Divider()
                }
              }
            }
          }
          .navigationTitle("Characters")
          .navigationBarTitleDisplayMode(.inline)
          .navigationBarBackButtonHidden(true)
          .scrollContentBackground(.hidden)
          LargeButton(label: "Return Home") {
            screen.currentScreen = .home
          }
          .padding()
        }
      }
    }
    .scrollContentBackground(.hidden)
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
