//
//  NewCharacterReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import SwiftUI

struct NewCharacterReview: View {
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  let modCalculator = ModCalculator()

  var body: some View {
    ZStack {
      GlobalBackground()
      VStack {
        GeneralCharacterReview(player: player)
        LargeButton(label: "Save Character", isDisabled: false) {
          screen.currentScreen = .characterSave
        }
        .padding()
      }
    }
  }
}

#Preview {
  let player = PlayerCharacter()
  player.name = "Drizzt D'Orden"
  player.title = "Destroyer of Men"
  player.alignment = .chaos
  player.abilityScores = [
    CharacterAbility(statType: .str, score: 15),
    CharacterAbility(statType: .dex, score: 12),
    CharacterAbility(statType: .con, score: 8),
    CharacterAbility(statType: .int, score: 18),
    CharacterAbility(statType: .wis, score: 15),
    CharacterAbility(statType: .cha, score: 12)
  ]
  player.characterClass = .cleric
  player.spells = [.magicMissile]
  player.armor = .plateMail
  player.hasShield = true
  player.weapons.append(.sword)
  player.weapons.append(.crossbow)
  player.ammo.append(.crossbowBolts)
  player.gear.append(.backpack)
  player.gear.append(.torches)
  return NewCharacterReview()
    .environment(player)
}
