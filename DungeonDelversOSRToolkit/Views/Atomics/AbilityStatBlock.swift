//
//  AbilityStatBlock.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct AbilityStatBlock: View {
  @State var scaleValue = 1.0
  @Binding var currentCharacterAbility: Ability
  @Binding var abilityScore: Int
  @Binding var abilityTitle: String
  var stat: Ability
  var isRolled: Bool {
    abilityScore > 0
  }
  let score: Int
  let ability: String
  let isDisabled = false
  let rectangleCornerSize = CGSize(width: 10, height: 10)
  let rectangleStrikeWidth = CGFloat(5)
  let rectangleFrameSize = CGFloat(75)
  let rectangleShadowOpacity = 0.8
  let rectangleShadowRadius = CGFloat(2.5)
  let scoreFontSize = CGFloat(26)
  let animationDuration = TimeInterval(0.10)
  let animationDelay = TimeInterval(0.12)
  let smallScaleValue = 0.85
  let largeScaleValue = 1.0

  var body: some View {
    ZStack {
      RoundedRectangle(cornerSize: rectangleCornerSize)
        .stroke(.black, lineWidth: rectangleStrikeWidth)
        .fill(isRolled ? Color("tkGreen") : Color.gray)
        .frame(width: rectangleFrameSize, height: rectangleFrameSize)
        .shadow(color: .black.opacity(rectangleShadowOpacity), radius: rectangleShadowRadius)
      VStack {
        Text("\(score)")
          .font(Font.custom("Courier", size: scoreFontSize))
          .foregroundStyle(isRolled ? Color.black : Color.black.opacity(0.4))
        Text("\(ability)")
          .font(.title2)
          .fontWeight(.bold)
          .foregroundStyle(isRolled ? Color.black : Color.black.opacity(0.4))
      }
    }
    .scaleEffect(scaleValue)
    .onTapGesture {
      currentCharacterAbility = stat
      abilityScore = currentCharacterAbility.score
      abilityTitle = currentCharacterAbility.statType.name
      withAnimation(.linear(duration: animationDuration)) {
        scaleValue = smallScaleValue
      }
      withAnimation(.easeIn(duration: animationDuration).delay(animationDelay)) {
        scaleValue = largeScaleValue
      }
    }
    .disabled(!isRolled)
  }
}


#Preview {
  let characterAbility = CharacterAbility(statType: .str, score: 18)
  let abilityScore = 18
  return AbilityStatBlock(
    currentCharacterAbility: .constant(characterAbility),
    abilityScore: .constant(abilityScore),
    abilityTitle: .constant(characterAbility.statType.name),
    stat: characterAbility,
    score: 18,
    ability: "Str"
  )
}
