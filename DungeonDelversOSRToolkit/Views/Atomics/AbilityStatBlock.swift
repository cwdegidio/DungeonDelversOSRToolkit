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
  let score: Int
  let ability: String

  var body: some View {
    ZStack {
      RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
        .stroke(.black, lineWidth: 5)
        .fill(Color("tkGreen"))
        .frame(width: 75, height: 75)
        .shadow(color: .black.opacity(0.8), radius: 2.5)
      VStack {
        Text("\(score)")
          .font(Font.custom("Courier", size: 26))
        Text("\(ability)")
          .font(.title2)
          .fontWeight(.bold)
      }
    }
    .scaleEffect(scaleValue)
    .onTapGesture {
      currentCharacterAbility = stat
      abilityScore = currentCharacterAbility.score
      abilityTitle = currentCharacterAbility.statType.name
      withAnimation(.linear(duration: 0.10)) {
        scaleValue = 0.85
      }
      withAnimation(.easeIn(duration: 0.10).delay(0.12)) {
        scaleValue = 1.0
      }
    }
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
