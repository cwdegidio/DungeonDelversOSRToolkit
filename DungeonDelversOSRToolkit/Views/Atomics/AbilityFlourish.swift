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
        .padding(.top, -10)
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

struct AbilityAdjustmentPortraitFlourish: View {
  let characterClass: String
  let xpBonus: String
  let abilityTitle: String
  @Binding var pointsPool: Int

  var body: some View {
    ZStack {
      Group {
        Triangle()
          .foregroundStyle(Color("tkRed"))
          .frame(width: 200, height: 200)
          .offset(x: -175)
        Triangle()
          .foregroundStyle(Color("tkYellow"))
          .frame(width: 200, height: 200)
          .offset(x: -75)
        Triangle()
          .foregroundStyle(Color("tkRed"))
          .rotationEffect(Angle(degrees: 180))
          .frame(width: 200, height: 200)
          .offset(x: 175)
        Triangle()
          .foregroundStyle(Color("tkYellow"))
          .rotationEffect(Angle(degrees: 180))
          .frame(width: 200, height: 200)
          .offset(x: 75)
        Hexagon()
          .foregroundStyle(Color("tkGreen"))
          .frame(width: 200, height: 250)
          .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 50)
        Hexagon()
          .stroke(Color(white: 0.8))
          .frame(width: 200, height: 250)
        AbilityTitle(content: "XP Bonus")
          .padding(.top, 100)
      }
      .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.4), radius: 20)
      AbilityTitle(content: characterClass)
        .padding(.bottom, 155)
      AbilityAdjustmentFlourish(content: xpBonus)
        .padding(.top, -30)
      Text("**Points Pool:** \(pointsPool)")
        .font(.title2)
        .padding(.top, 175)
    }
  }
}

struct AbilityAdjustmentLandscapeFlourish: View {
  let characterClass: String
  let xpBonus: String
  let abilityTitle: String
  @Binding var pointsPool: Int

  var body: some View {
    ZStack {
      Group {
        Hexagon()
          .foregroundStyle(Color("tkGreen"))
          .frame(width: 200, height: 250)
          .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 50)
        Hexagon()
          .stroke(Color(white: 0.8))
          .frame(width: 200, height: 250)
        AbilityTitle(content: "XP Bonus")
          .padding(.top, 100)
      }
      .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.4), radius: 20)
      AbilityTitle(content: characterClass)
        .padding(.bottom, 155)
      AbilityAdjustmentFlourish(content: xpBonus)
        .padding(.top, -30)
      Text("**Points Pool:** \(pointsPool)")
        .font(.title2)
        .padding(.top, 175)
    }
  }
}

#Preview("Ability Portrait Flourish") {
  AbilityPortraitFlourish(abilityScore: 18, abilityTitle: "Strength")
}

#Preview("Ability Landscape Flourish") {
  AbilityLandscapeFlourish(abilityScore: 18, abilityTitle: "Strength")
}

#Preview("Ability Adjustment Portrait Flourish") {
  AbilityAdjustmentPortraitFlourish(
    characterClass: "Cleric",
    xpBonus: "-20%",
    abilityTitle: "Strength",
    pointsPool: .constant(5)
  )
}

#Preview("Ability Adjustment Landscape Flourish") {
  AbilityAdjustmentLandscapeFlourish(
    characterClass: "Cleric",
    xpBonus: "-20%",
    abilityTitle: "Strength",
    pointsPool: .constant(5)
  )
}
