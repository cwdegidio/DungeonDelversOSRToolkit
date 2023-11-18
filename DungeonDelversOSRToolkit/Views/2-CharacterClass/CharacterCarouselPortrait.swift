//
//  CharacterCarouselPortrait.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/17/23.
//

import SwiftUI

struct CharacterCarouselPortrait: View {
  @EnvironmentObject var player: PlayerCharacter
  @Binding var showSheet: Bool
  var thisClass: CharacterClass
  var viewModel: CharacterClassSelectionViewModel

  var body: some View {
    VStack {
      Image(thisClass.imgName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .shadow(radius: 5)
        .border(.black.opacity(0.25), width: 3.0)
        .padding(.horizontal, 20)
      AbilityTitle(content: thisClass.name)
      SmallButton(
        label: "View \(thisClass.name) Features",
        icon: "\(thisClass.symbol)",
        bgColor: Color("tkBlue"),
        fgColor: Color.white
      ) {
        showSheet.toggle()
      }
      .padding(.bottom, 10)
      .sheet(isPresented: $showSheet) {
        CharacterClassDetailSheet(characterClass: thisClass)
          .presentationDetents([.large])
          .presentationDragIndicator(.visible)
      }
      SmallButton(
        label: "Choose \(thisClass.name)",
        icon: "checkmark",
        bgColor: Color("tkGreen"),
        fgColor: Color.white
      ) {
        viewModel.setCharacterClass(as: thisClass, for: player)
        print("[ DEBUG ] Player class is: \(player.characterClass?.name ?? "no class assigned")")
      }
      Instruction(content: thisClass.description)
        .padding(.top)
        .frame(height: 80, alignment: .top)
    }
    .padding(20)
    .frame(maxHeight: .infinity, alignment: .top)
  }
}

#Preview {
  let player = PlayerCharacter()
  player.abilityScores = [
    CharacterAbility(statType: .str, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
  ]
  return CharacterCarouselPortrait(
    showSheet: .constant(false),
    thisClass: CharacterClass.magicUser,
    viewModel: CharacterClassSelectionViewModel()
  )
}
