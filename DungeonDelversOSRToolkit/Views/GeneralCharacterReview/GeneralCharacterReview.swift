//
//  GeneralCharacterReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import SwiftUI

struct GeneralCharacterReview: View {
  @StateObject var player: PlayerCharacter
  @State private var abilitiesExpanded = false
  @State private var savingThrowsExpanded = false
  @State private var combatExpanded = false
  @State private var attValMatrixExpanded = false
  @State private var classFeaturesExpanded = false
  @State private var thiefSkillsExpanded = false
  @State private var turningUndeadExpanded = false
  @State private var spellsExpanded = false
  @State private var encountersExpanded = false
  @State private var explorationExpanded = false
  @State private var movementExpanded = false
  @State private var languagesExpanded = false
  @State private var advancementExpanded = false
  @State private var armorExpanded = false
  @State private var weaponExpanded = false
  @State private var gearExpanded = false

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        VStack(alignment: .leading) {
          AbilityTitle(content: player.name)
          HStack {
            Text(player.title.isEmpty ? "**Title**: None" : "**Title**: \(player.title)")
            Spacer()
            Text(player.characterClass?.name ?? "No Class")
          }
          HStack {
            Text("**Alignment:** \(player.alignment?.name ?? "No alignment")")
            Spacer()
            Text("**Level:** \(player.level)")
          }
        }
        Divider()
        DisclosureGroup("Abilities", isExpanded: $abilitiesExpanded) {
          AbilitiesSubReview()
            .environmentObject(player)
        }
        DisclosureGroup("Saving Throws", isExpanded: $savingThrowsExpanded) {
          SavingThrowsSubReview()
            .environmentObject(player)
        }
        DisclosureGroup("Combat", isExpanded: $combatExpanded) {
          CombatSubReview()
            .environmentObject(player)
        }
        DisclosureGroup("Attack Value Matrix", isExpanded: $attValMatrixExpanded) {
          AttackMatrix()
            .environmentObject(player)
        }
        DisclosureGroup("Class Features", isExpanded: $classFeaturesExpanded) {
          ClassAbilitySubReview()
            .environmentObject(player)
        }

        if player.characterClass == .thief {
          DisclosureGroup("Thieve's Skills", isExpanded: $thiefSkillsExpanded) {
            ThievesSkillsSubReview()
              .environmentObject(player)
          }
        } else if player.characterClass == .cleric {
          DisclosureGroup("Turning the Undead", isExpanded: $turningUndeadExpanded) {
            TurningUndeadSubReview()
              .environmentObject(player)
          }
        } else if player.characterClass == .magicUser {
          DisclosureGroup("Spells", isExpanded: $spellsExpanded) {
            SpellsReview()
              .environmentObject(player)
          }
        }

        DisclosureGroup("Encounters", isExpanded: $encountersExpanded) {
          EncountersSubReview()
            .environmentObject(player)
        }
        DisclosureGroup("Exploration", isExpanded: $explorationExpanded) {
          ExplorationSubReview()
            .environmentObject(player)
        }
        DisclosureGroup("Movement", isExpanded: $movementExpanded) {
          MovementSubReview()
            .environmentObject(player)
        }
        DisclosureGroup("Languages", isExpanded: $languagesExpanded) {
          LanguageSubReview()
            .environmentObject(player)
        }
        DisclosureGroup("Advancement", isExpanded: $advancementExpanded) {
          AdvancementSubReview()
            .environmentObject(player)
        }
        DisclosureGroup("Armor", isExpanded: $armorExpanded) {
          ArmorSubReview()
            .environmentObject(player)
        }
        DisclosureGroup("Weapons & Ammunition", isExpanded: $weaponExpanded) {
          WeaponsSubReview()
            .environmentObject(player)
        }
        DisclosureGroup("Gear", isExpanded: $gearExpanded) {
          GearSubReview()
            .environmentObject(player)
        }
      }
      .padding()
      .background(Color.white)
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .padding()
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
  return GeneralCharacterReview(player: player)
}
