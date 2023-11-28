//
//  CloudCharacterVault.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/28/23.
//

import SwiftUI

struct CloudCharacterVault: View {
  @EnvironmentObject var review: ReviewModel
  @EnvironmentObject var screen: ApplicationScreen
  @StateObject var viewModel = CloudCharacterVaultViewModel()

  var body: some View {
    NavigationStack {
      ZStack {
        GlobalBackground()
        VStack {
          List {
            ScrollView {
              ForEach(viewModel.characters.sorted { $0.name < $1.name }, id: \.id) { character in
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
    .task {
      do {
        try await viewModel.getLocalCharacters()
      } catch {
        print("[ DEBUG ] Issue getting the characters!")
      }
    }
  }
}

#Preview {
  return CloudCharacterVault()
}
