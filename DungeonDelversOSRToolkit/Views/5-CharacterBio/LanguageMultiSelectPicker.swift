//
//  LanguageMultiSelectPicker.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/22/23.
//

import SwiftUI

struct LanguageMultiSelectPicker: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  @State var languageList: [Language] = []
  @State var languagesSelected: [Language] = []
  @State var languageLimit = 0
  let viewModel = CharacterBioViewModel()
  var selectedLanguageString: String {
    if !player.additionalLanguages.isEmpty {
      var text = player.additionalLanguages.first?.name ?? ""
      if player.additionalLanguages.count > 1 {
        for i in 1..<player.additionalLanguages.count {
          text += ", \(player.additionalLanguages[i].name)"
        }
      }
      return text
    }
    return "None"
  }

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

    let layout = portrait ?
    AnyLayout(VStackLayout()) :
    AnyLayout(HStackLayout())

    VStack {
      layout {
        Text("**Languages Remaining:** \(languageLimit - player.additionalLanguages.count)")
          .padding(.trailing, portrait ? 0 : 10)
        Text("**Languages Selected:**")
        Text(selectedLanguageString)
      }
      List {
        ForEach(languageList, id: \.self) { language in
          Button {
            if !player.additionalLanguages.contains(language) && player.additionalLanguages.count < languageLimit {
              player.additionalLanguages.append(language)
            } else {
              player.additionalLanguages.removeAll { $0 == language }
            }
            print(player.additionalLanguages)
          } label: {
            HStack {
              Text(language.name)
                .foregroundColor(.black)
              Spacer()
              if player.additionalLanguages.contains(language) {
                Image(systemName: "checkmark")
                  .foregroundStyle(Color("tkBlue"))
              }
            }
          }
        }
      }
      .listStyle(.plain)
      .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 5)))
    }
    .onAppear {
      guard let characterClass = player.characterClass else {
        print("No character class selected")
        return
      }

      languageList = Language.allCases.filter { language in
        !characterClass.languages.contains(language)
      }

      languageLimit = viewModel.getNumberOfLanguages(for: player)
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
  return LanguageMultiSelectPicker()
    .environment(player)
}
