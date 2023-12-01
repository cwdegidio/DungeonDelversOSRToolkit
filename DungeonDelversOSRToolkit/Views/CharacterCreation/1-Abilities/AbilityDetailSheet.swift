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
      AbilityDetailTitle(content: "\(stat.name) Modifiers")
      Text(stat.description)
        .padding(.bottom)
      VStack(alignment: .leading) {
        ForEach(player.modifiers.filter { $0.asscStat == stat }, id: \.modType) { modifier in
          let modifierName = modifier.modType.name
          let modifierDescription = modifier.modType.description
          let modifierString = viewModel.getModifierString(for: modifier, player: player)
          DisclosureGroup {
            Text(modifierDescription)
              .padding(.leading)
              .frame(maxWidth: .infinity, alignment: .leading)
          } label: {
            BulletedText(content: "**\(modifierName):** \(modifierString)")
              .foregroundStyle(Color.primary)
          }
        }
      }
      .padding(.bottom)
      SmallButton(label: "Got it!", icon: "hand.thumbsup.fill", bgColor: Color("tkBlue"), isDisabled: false) {
        dismiss()
      }
    }
    .padding()
  }
}

#Preview {
  AbilityDetailSheet(stat: .str)
    .environment(PlayerCharacter())
}
