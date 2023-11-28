//
//  CharacterManagementReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import SwiftUI

struct CharacterManagementReview: View {
  @EnvironmentObject var review: ReviewModel
  @EnvironmentObject var screen: ApplicationScreen

    var body: some View {
      ZStack {
        GlobalBackground()
        VStack {
          if let character = review.currentCharacter {
            GeneralCharacterReview(player: character)
          } else {
            Text("No characters to review")
          }
          LargeButton(label: "Return to Home") {
            screen.currentScreen = .home
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
  let review = ReviewModel()
  review.currentCharacter = player
  return CharacterManagementReview()
    .environmentObject(review)
}
