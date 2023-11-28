//
//  ExplorationSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct ExplorationSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = ExplorationSubReviewModel()

  var body: some View {
    VStack(alignment: .leading) {
      let listenData = viewModel.getListenAtDoor(for: player)
      ReviewItem(
        itemName: listenData.name,
        itemValue: String(describing: listenData.value),
        subText: listenData.subText
      )

      let openData = viewModel.getOpenDoor(for: player)
      ReviewItem(
        itemName: openData.name,
        itemValue: String(describing: openData.value),
        subText: openData.subText
      )

      let secretData = viewModel.getSecretDoor(for: player)
      ReviewItem(
        itemName: secretData.name,
        itemValue: String(describing: secretData.value),
        subText: secretData.subText
      )

      let trapData = viewModel.getFindRoomTrap(for: player)
      ReviewItem(
        itemName: trapData.name,
        itemValue: String(describing: trapData.value),
        subText: trapData.subText
      )
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  let player = PlayerCharacter()
  player.abilityScores = [
    CharacterAbility(statType: .str, score: 17),
    CharacterAbility(statType: .dex, score: 18),
    CharacterAbility(statType: .con, score: 8),
    CharacterAbility(statType: .int, score: 18),
    CharacterAbility(statType: .wis, score: 16),
    CharacterAbility(statType: .cha, score: 18)
  ]
  player.characterClass = .elf
  return ExplorationSubReview()
    .environment(player)
}
