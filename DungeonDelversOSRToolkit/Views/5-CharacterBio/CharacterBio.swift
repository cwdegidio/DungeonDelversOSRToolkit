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
  @FocusState private var nameFieldFocused: Bool
  @FocusState private var titleFieldFocused: Bool
  @State var characterName = ""
  @State var characterTitle = ""
  @State var selectedLanguage: Language = .common

  var body: some View {
    ZStack {
      GlobalBackground()
      VStack {
       VStack {
         CharacterBioTextField(playerFieldToUpdate: $player.name, enteredText: $characterName, title: "Name", emptyTextContent: "Give your character a name...")
//          VStack(alignment: .leading) {
//            Subtitle(content: "Name")
//              .padding(.leading, 5)
//              .padding(.bottom, -5)
//            TextField(text: $characterName) {
//              Text("Enter your characters name...")
//            }
//            .padding(10)
//            .background(.white)
//            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 5)))
//            .focused($nameFieldFocused)
//            .onLongPressGesture(minimumDuration: 0.0) {
//              nameFieldFocused = true
//            }
//            .autocorrectionDisabled()
//            .onChange(of: nameFieldFocused) {
//              player.name = characterName
//            }
//          }
//          .padding()
//          VStack(alignment: .leading) {
//            Subtitle(content: "Title")
//              .padding(.leading, 5)
//              .padding(.bottom, -5)
//            TextField(text: $characterTitle) {
//              Text("Enter your characters title...")
//            }
//            .padding(10)
//            .background(.white)
//            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 5)))
//            .focused($titleFieldFocused)
//            .onLongPressGesture(minimumDuration: 0.0) {
//              titleFieldFocused = true
//            }
//            .autocorrectionDisabled()
//            .onChange(of: titleFieldFocused) {
//              player.title = characterTitle
//            }
//          }
//          .padding()
         CharacterBioTextField(playerFieldToUpdate: $player.title, enteredText: $characterTitle, title: "Title (Optional)", emptyTextContent: "Give yourself a title...")
        }
        VStack {
          LanguageMultiSelectPicker()
        }
        .padding()
        Spacer()
        LargeButton(label: "Next Step: Biography") {
          print("[ DEBUG ] Character Name: \(player.name ?? "")")
          print("[ DEBUG ] Character Title: \(player.title ?? "")")
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
