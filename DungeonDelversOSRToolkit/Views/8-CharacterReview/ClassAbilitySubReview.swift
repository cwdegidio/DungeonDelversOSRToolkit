//
//  ClassAbilitySubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import SwiftUI

struct ClassAbilitySubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = ClassAbilitySubReviewModel()

  var body: some View {
    let abilities = viewModel.getClassAbilities(for: player)
    VStack(alignment: .leading) {
      ForEach(abilities, id: \.self) { ability in
        Text(MarkdownHelper.returnMarkdown(for: ability) ?? "")
          .padding(.bottom, 5)
      }
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  let player = PlayerCharacter()
  player.characterClass = .halfling
  return ClassAbilitySubReview()
    .environment(player)
}
