//
//  CharacterReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import SwiftUI

struct CharacterReview: View {
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  let modCalculator = ModCalculator()
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
    ZStack {
      GlobalBackground()
      VStack {
        ScrollView {
          VStack(alignment: .leading) {
            VStack(alignment: .leading) {
              AbilityTitle(content: player.name)
              Subtitle(content: player.title)
              HStack {
                Text("**Alignment:** \(player.alignment?.name ?? "No alignment")")
                Spacer()
                Text("**Level:** \(player.level)")
              }
            }
            Divider()
            DisclosureGroup("Abilities", isExpanded: $abilitiesExpanded) {
              AbilitiesSubReview()
            }
            DisclosureGroup("Saving Throws", isExpanded: $savingThrowsExpanded) {
              SavingThrowsSubReview()
            }
            DisclosureGroup("Combat", isExpanded: $combatExpanded) {
              CombatSubReview()
            }
            DisclosureGroup("Attack Value Matrix", isExpanded: $attValMatrixExpanded) {
              AttackMatrix()
            }
            DisclosureGroup("Class Features", isExpanded: $classFeaturesExpanded) {
              ClassAbilitySubReview()
            }

            if player.characterClass == .thief {
              DisclosureGroup("Thieve's Skills", isExpanded: $thiefSkillsExpanded) {
                ThievesSkillsSubReview()
              }
            } else if player.characterClass == .cleric {
              DisclosureGroup("Turing the Undead", isExpanded: $turningUndeadExpanded) {
                TurningUndeadSubReview()
              }
            } else if player.characterClass == .magicUser {
              DisclosureGroup("Spells", isExpanded: $spellsExpanded) {
                SpellsReview()
              }
            }

            DisclosureGroup("Encounters", isExpanded: $encountersExpanded) {
              EncountersSubReview()
            }
            DisclosureGroup("Exploration", isExpanded: $explorationExpanded) {
              ExplorationSubReview()
            }
            DisclosureGroup("Movement", isExpanded: $movementExpanded) {
              MovementSubReview()
            }
            DisclosureGroup("Languages", isExpanded: $languagesExpanded) {
              LanguageSubReview()
            }
            DisclosureGroup("Advancement", isExpanded: $advancementExpanded) {
              AdvancementSubReview()
            }
            DisclosureGroup("Armor", isExpanded: $armorExpanded) {
              ArmorSubReview()
            }
            DisclosureGroup("Weapons & Ammunition", isExpanded: $weaponExpanded) {
              WeaponsSubReview()
            }
            DisclosureGroup("Gear", isExpanded: $gearExpanded) {
              GearSubReview()
            }
          }
          .padding()
          .background(Color.white)
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .padding()
        }
        LargeButton(label: "Save Character") {
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
  return CharacterReview()
    .environment(player)
}
