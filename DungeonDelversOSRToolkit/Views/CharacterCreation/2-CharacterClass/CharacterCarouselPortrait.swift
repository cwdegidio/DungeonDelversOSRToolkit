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
  let imageShadowRadius = CGFloat(5)
  let imageBorderOpacity = 0.25
  let imageBorderWidth = CGFloat(3)
  let featureButtonPadding = CGFloat(10)
  let instructionFrameHeight = CGFloat(80)

  var body: some View {
    VStack {
      Image(thisClass.imgName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .shadow(radius: imageShadowRadius)
        .border(.black.opacity(imageBorderOpacity), width: imageBorderWidth)
        .padding(.horizontal)
      AbilityTitle(content: thisClass.name)
      SmallButton(
        label: "View \(thisClass.name) Features",
        icon: "\(thisClass.symbol)",
        bgColor: Color("tkBlue"),
        isDisabled: false
      ) {
        showSheet.toggle()
      }
      .padding(.bottom, featureButtonPadding)
      .sheet(isPresented: $showSheet) {
        CharacterClassDetailSheet(characterClass: thisClass)
          .presentationDetents([.large])
          .presentationDragIndicator(.visible)
      }
      SmallButton(
        label: "Choose \(thisClass.name)",
        icon: player.characterClass == thisClass ? "checkmark" : "questionmark",
        bgColor: player.characterClass == nil || player.characterClass != thisClass ?
        Color("tkBlue") : Color("tkGreen"),
        isDisabled: false
      ) {
        viewModel.setCharacterClass(as: thisClass, for: player)
      }
      Instruction(content: thisClass.description)
        .padding(.top)
        .frame(height: instructionFrameHeight, alignment: .top)
    }
    .padding()
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
  .environment(player)
}
