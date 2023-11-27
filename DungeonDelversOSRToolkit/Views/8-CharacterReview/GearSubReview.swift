//
//  GearSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct GearSubReview: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = GearSubReviewModel()

  var body: some View {
    VStack {
      let gear = viewModel.getGear(for: player)
      Text(gear.joined(separator: ", "))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  let player = PlayerCharacter()
  player.gear.append(.backpack)
  player.gear.append(.grapplingHook)
  player.gear.append(.rationsStandard)
  player.gear.append(.torches)
  player.gear.append(.tinderBox)
  return GearSubReview()
    .environment(player)
}
