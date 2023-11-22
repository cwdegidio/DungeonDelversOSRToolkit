//
//  CharacterDetailsPresentationLandscape.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/22/23.
//

import SwiftUI

struct CharacterDetailsPresentationLandscape: View {
  @EnvironmentObject var player: PlayerCharacter
  @Binding var hpRolled: Bool

  var body: some View {
    VStack {
      HStack {
        VStack {
          HitPointsGenerator(hpRolled: $hpRolled)
        }
        VStack {
          Spacer()
          GoldGenerator()
            .padding(.bottom)
          AlignmentSelector()
        }
      }
      Spacer()
      LargeButton(label: "Next Step: Biography") {
        print("TODO")
      }
      .padding(.horizontal, 20)
      .padding(.bottom, 20)
    }
  }
}

#Preview {
  CharacterDetailsPresentationLandscape(hpRolled: .constant(true))
    .environment(PlayerCharacter())
}
