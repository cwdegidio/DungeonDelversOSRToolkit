//
//  Spells.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct Spells: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  @State var selectedSpell: MUSpell = .charmPerson
  let viewModel = SpellsViewModel()

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

    let layout = portrait ?
    AnyLayout(VStackLayout()) :
    AnyLayout(HStackLayout())

    ZStack {
      GlobalBackground()
      VStack {
        VStack(alignment: .leading) {
          layout {
            AbilityTitle(content: "Spell Selection")
              .padding(.trailing, portrait ? 0 : 10)
            List {
              Picker("Spell Selected", selection: $selectedSpell) {
                ForEach(MUSpell.allCases, id: \.self) { spell in
                  Text(spell.name)
                }
              }
              .onChange(of: selectedSpell) {
                viewModel.updatePlayerSpells(for: player, with: selectedSpell)
              }
            }
            .frame(height: 50)
            .listStyle(.plain)
            .padding(.bottom, portrait ? 20 : 0)
          }

          selectedSpell.descriptionView
          Spacer()
          LargeButton(label: "Next Step: Equipment") {
            screen.currentScreen = .equipment
          }
          .padding()
        }
      }
      .padding()
    }
    .onAppear {
      player.spells.append(.charmPerson)
    }
  }
}

#Preview {
  let player = PlayerCharacter()
  return Spells()
    .environment(player)
}
