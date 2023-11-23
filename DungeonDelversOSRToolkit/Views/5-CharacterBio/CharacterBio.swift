//
//  CharacterBio.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/22/23.
//

import SwiftUI

struct CharacterBio: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  @FocusState var focusedField: UUID?
  @State var characterName = ""
  @State var characterTitle = ""
  @State var selectedLanguage: Language = .common

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

    let layout = portrait ?
    AnyLayout(VStackLayout()) :
    AnyLayout(HStackLayout())

    ZStack {
      GlobalBackground()
      VStack {
        layout {
          CharacterBioTextField(
            playerFieldToUpdate: $player.name,
            enteredText: $characterName,
            focusedField: $focusedField,
            title: "Name",
            emptyTextContent: "Give your character a name..."
          )
          CharacterBioTextField(
            playerFieldToUpdate: $player.title,
            enteredText: $characterTitle,
            focusedField: $focusedField,
            title: "Title (Optional)",
            emptyTextContent: "Give yourself a title..."
          )
        }
        VStack {
          LanguageMultiSelectPicker()
        }
        .padding()
        Spacer()
        LargeButton(label: "Next Step: Biography") {
          print("[ DEBUG ] Character Name: \(player.name)")
          print("[ DEBUG ] Character Title: \(player.title)")
          print("[ DEBUG ] Character Languages: \(player.additionalLanguages)")
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
      }
    }
  }
}

#Preview {
  let player = PlayerCharacter()
  player.characterClass = .elf
  player.abilityScores = [
    CharacterAbility(statType: .str, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .int, score: 18),
    CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
  ]
  return CharacterBio()
    .environment(player)
}
