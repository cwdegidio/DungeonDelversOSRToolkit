//
//  CharacterCarouselLandscape.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/17/23.
//

import SwiftUI

struct CharacterCarouselLandscape: View {
  @EnvironmentObject var player: PlayerCharacter
  @Binding var showSheet: Bool
  var thisClass: CharacterClass
  var viewModel: CharacterClassSelectionViewModel
  let imageShadowRadius = CGFloat(5)
  let imageBorderOpacity = 0.25
  let imageBorderWidth = CGFloat(2)

  var body: some View {
    HStack(alignment: .bottom) {
      VStack {
        Image(thisClass.imgName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .shadow(radius: imageShadowRadius)
          .border(.black.opacity(imageBorderOpacity), width: imageBorderWidth)
          .frame(maxWidth: .infinity, alignment: .bottom)
          .padding(.top)
      }
      VStack {
        AbilityTitle(content: thisClass.name)
        Instruction(content: thisClass.description)
        SmallButton(
          label: "View \(thisClass.name) Features",
          icon: "\(thisClass.symbol)",
          bgColor: Color("tkBlue"),
          isDisabled: false
        ) {
          showSheet.toggle()
        }
        .padding(.bottom)
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
      }
      .padding(.leading)
      .padding(.trailing)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
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
  return CharacterCarouselLandscape(
    showSheet: .constant(false),
    thisClass: CharacterClass.magicUser,
    viewModel: CharacterClassSelectionViewModel()
  )
  .environment(player)
}
