//
//  ArmorDetail.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import SwiftUI

struct ArmorDetail: View {
  @EnvironmentObject var player: PlayerCharacter
  let armor: Armor

  var body: some View {
    ZStack {
      GlobalBackground()
      VStack(alignment: .leading) {
        HStack(alignment: .center) {
          Image(armor.imgName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity)
        AbilityTitle(content: armor.name)
        Text("**Cost:** \(armor.cost)gp")
          .font(.title2)
        Text("**Armor Class (AC):** \(armor.armorClass)")
        Text(armor.description)
        SmallButton(label: "Purchase", icon: "dollarsign.arrow.circlepath", bgColor: Color("tkGreen"), fgColor: Color.white) {
          if let goldPieces = player.coins[.goldPieces] {
            if goldPieces > armor.cost {
              if armor == Armor.shield {
                player.hasShield = true
              } else {
                player.armor = armor
              }
              player.coins.updateValue(goldPieces - armor.cost, forKey: .goldPieces)
            }
          }
        }
        Text("**Remaining Gold:** \(player.coins[.goldPieces] ?? 0)")
        Spacer()
      }
      .padding()
    }
  }
}

#Preview {
  let player = PlayerCharacter()
  player.coins.updateValue(132, forKey: .goldPieces)
  return ArmorDetail(armor: .leather)
    .environment(player)
}
