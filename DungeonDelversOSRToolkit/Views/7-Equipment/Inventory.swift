//
//  Inventory.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import SwiftUI

struct Inventory: View {
  @EnvironmentObject var player: PlayerCharacter
  var weight: Int {
    calculateWeight()
  }

  var body: some View {
    ZStack {
      GlobalBackground()
      VStack(alignment: .leading) {
        AbilityTitle(content: "Inventory")
        Text("**Gold Pieces:** \(player.coins[.goldPieces] ?? 0)")
        Text("**Weight:** \(weight) coins")
        Divider()
        Subtitle(content: "Armor")
        Text("**Current Armor:** \(player.armor?.name ?? "None")")
        Text("**Shield?** \(player.hasShield ? "Yes" : "No")")
        Divider()
      }
      .frame(maxWidth: .infinity)
      .padding()
    }
  }

  func calculateWeight() -> Int {
    var totalWeight = 0
    for coin in player.coins {
      totalWeight += coin.value
    }

    if let armor = player.armor {
      totalWeight += armor.weight
    }

    if player.hasShield {
      totalWeight += Armor.shield.weight
    }

    return totalWeight
  }
}

#Preview {
  let player = PlayerCharacter()
  player.coins[.goldPieces] = 73
  player.armor = .plateMail
  player.hasShield = true
  return Inventory()
    .environment(player)
}
