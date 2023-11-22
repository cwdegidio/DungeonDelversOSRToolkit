//
//  GoldGenerator.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/22/23.
//

import SwiftUI

struct GoldGenerator: View {
  @EnvironmentObject var player: PlayerCharacter
  var startingdGoldMultiplier = 10
  var startingGoldRange = 3...18

  var body: some View {
    VStack {
      HStack {
        Subtitle(content: "Gold: ")
        Text("\(player.coins.first { $0.key == Coinage.goldPieces }?.value ?? 0)")
          .font(Font.system(size: 21.0, design: .monospaced))
      }
      SmallButton(
        label: "Roll Starting Gold",
        icon: "banknote.fill",
        bgColor: Color("tkGreen"),
        fgColor: Color.white
      ) {
        let startingGold = Int.random(in: startingGoldRange) * startingdGoldMultiplier
        player.coins.updateValue(startingGold, forKey: .goldPieces)
      }
    }
    .padding(.horizontal)
  }
}

#Preview {
  GoldGenerator()
    .environment(PlayerCharacter())
}
