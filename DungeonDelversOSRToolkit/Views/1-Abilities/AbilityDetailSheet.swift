//
//  AbilityDetailSheet.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/16/23.
//

import SwiftUI

struct AbilityDetailSheet: View {
  @EnvironmentObject var player: PlayerCharacter

  @Environment(\.dismiss)
  var dismiss

  var modCalc = ModCalculator()
  var viewModel = ModifierViewModel()
  var stat: Stat

  var body: some View {
    VStack {
      AbilityTitle(content: stat.name)
      Text(stat.description)
        .padding(.bottom, 20)
      VStack(alignment: .leading) {
        ForEach(player.modifiers.filter { $0.asscStat == stat }, id: \.modType) { modifier in
          let modifierName = modifier.modType.name
          let modifierDescription = modifier.modType.description
          BulletedText(content: "**\(modifierName):** \(modifierDescription)")
        }
      }
      .padding(.bottom, 15)
      Subtitle(content: "Modifiers")
      VStack(alignment: .leading) {
        ForEach(player.modifiers.filter { $0.asscStat == stat }, id: \.modType) { modifier in
          let modifierName = modifier.modType.name
          let modifierString = viewModel.getModifierString(for: modifier, player: player)
          BulletedText(content: "**\(modifierName):** \(modifierString)")
        }
      }
      .padding(.bottom, 20)
      SmallButton(label: "Got it!", icon: "hand.thumbsup.fill", bgColor: Color("tkBlue")) {
        dismiss()
      }
    }
    .padding(20)
  }
}

#Preview {
  AbilityDetailSheet(stat: .str)
    .environment(PlayerCharacter())
}
