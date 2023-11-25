//
//  Inventory.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import SwiftUI

struct Inventory: View {
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = EquipmentViewModel()
  var weight: Int {
    viewModel.calculateWeight(for: player)
  }

  var body: some View {
    ZStack {
      GlobalBackground()
      ScrollView {
        VStack(alignment: .leading) {
          AbilityTitle(content: "Inventory")
          Text("**Gold Pieces:** \(player.coins[.goldPieces] ?? 0)")
          Text("**Weight:** \(weight) coins")
          Divider()
          Subtitle(content: "Armor")
          Text("**Current Armor:** \(player.armor?.name ?? "None")")
          Text("**Shield?** \(player.hasShield ? "Yes" : "No")")
          Divider()
          Subtitle(content: "Weapons")
          if !player.weapons.isEmpty {
            ForEach(player.weapons, id: \.self) { weapon in
              BulletedText(content: weapon.name)
            }
          } else {
            Text("No weapons in inventory.")
          }
          Divider()
          Subtitle(content: "Ammo")
          if !player.ammo.isEmpty {
            ForEach(player.ammo, id: \.self) { ammo in
              BulletedText(content: ammo.name)
            }
          } else {
            Text("No ammo in inventory.")
          }
          Divider()
          Subtitle(content: "Gear")
          if !player.gear.isEmpty {
            ForEach(player.gear, id: \.self) { gear in
              BulletedText(content: gear.name)
            }
          } else {
            Text("No ammo in inventory.")
          }
        }
        .padding()
        .background(Color.white)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
      }
    }
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
