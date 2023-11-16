//
//  AbilityFlourish.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct AbilityPortraitFlourish: View {
  let abilityScore: Int
  let abilityTitle: String

  var body: some View {
    AbilityTitle(content: abilityTitle)
    ZStack {
      Group {
        Circle()
          .foregroundStyle(Color(red: 0.58, green: 0.67, blue: 0.40))
          .frame(width: 100)
          .offset(x: -150)
        Circle()
          .foregroundStyle(Color(red: 0.58, green: 0.67, blue: 0.40))
          .frame(width: 100)
          .offset(x: 150)
        Circle()
          .foregroundStyle(Color(red: 0.68, green: 0.18, blue: 0.21))
          .frame(width: 150)
          .offset(x: -75)
        Circle()
          .foregroundStyle(Color(red: 0.68, green: 0.18, blue: 0.21))
          .frame(width: 150)
          .offset(x: 75)
        CircularStar()
          .foregroundStyle(Color(red: 0.80, green: 0.59, blue: 0.18))
          .frame(width: 200, height: 200)
          .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 50)
        CircularStar()
          .stroke(Color(white: 0.8))
          .frame(width: 200, height: 200)
      }
      .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.4), radius: 20)
      AbilityScoreFlourish(content: abilityScore)
        .padding(.top, 5)
    }
  }
}

struct AbilityLandscapeFlourish: View {
  let abilityScore: Int
  let abilityTitle: String

  var body: some View {
    ZStack {
      Group {
        CircularStar()
          .foregroundStyle(Color(red: 0.80, green: 0.59, blue: 0.18))
          .frame(width: 200, height: 200)
          .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 50)
        CircularStar()
          .stroke(Color(white: 0.8))
          .frame(width: 200, height: 200)
      }
      .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.4), radius: 20)
      AbilityScoreFlourish(content: abilityScore)
        .padding(.top, 5)
      AbilityTitle(content: abilityTitle)
        .padding(.top, -100)
    }
  }
}

#Preview("Ability Portrait Flourish") {
  AbilityPortraitFlourish(abilityScore: 18, abilityTitle: "Strength")
}

#Preview("Ability Landscape Flourish") {
  AbilityLandscapeFlourish(abilityScore: 18, abilityTitle: "Strength")
}
