//
//  CharacterDetailsPresentationPortrait.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/22/23.
//

import SwiftUI

struct CharacterDetailsPresentationPortrait: View {
  @EnvironmentObject var player: PlayerCharacter
  @Binding var hpRolled: Bool

  var body: some View {
    VStack {
      HitPointsGenerator(hpRolled: $hpRolled)
      Divider()
        .padding(.top, -20)
      GoldGenerator()
      Divider()
        .padding(.vertical)
      AlignmentSelector()
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
  CharacterDetailsPresentationPortrait(hpRolled: .constant(true))
    .environment(PlayerCharacter())
}
