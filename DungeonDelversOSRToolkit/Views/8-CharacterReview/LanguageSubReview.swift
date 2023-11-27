//
//  LanguageSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct LanguageSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = LanguageSubReviewModel()

  var body: some View {
    VStack {
      let langString = viewModel.getLanguages(for: player)
      let literacy = viewModel.getLiteracy(for: player)
      Text(langString)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 5)
      Text("**Literacy?** \(literacy)")
        .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

#Preview {
  let player = PlayerCharacter()
  player.abilityScores = [
    CharacterAbility(statType: .str, score: 17),
    CharacterAbility(statType: .dex, score: 18),
    CharacterAbility(statType: .con, score: 8),
    CharacterAbility(statType: .int, score: 6),
    CharacterAbility(statType: .wis, score: 16),
    CharacterAbility(statType: .cha, score: 18)
  ]
  player.characterClass = .elf
  player.additionalLanguages = [.dragon, .pixie]
  return LanguageSubReview()
    .environment(player)
}
