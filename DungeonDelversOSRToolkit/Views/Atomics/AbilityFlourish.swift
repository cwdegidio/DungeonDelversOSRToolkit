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
  let smallCircleFrame = CGFloat(100)
  let mediumCircleFrame = CGFloat(150)
  let largeCircleFrame = CGFloat(200)
  let largeCircleShadowOpacity = 0.25
  let largeCircleShadowRadius = CGFloat(50)
  let largeCircleStrokeOpacity = 0.8
  let flourishShadowOpacity = 0.4
  let flourishShadowRadius = CGFloat(20)
  let abilityScorePadding = CGFloat(0)
  let smallCircleOffsetX = CGFloat(150)
  let mediumCircleOffsetX = CGFloat(75)

  var body: some View {
    ZStack {
      Group {
        Circle()
          .foregroundStyle(Color("tkGreen"))
          .frame(width: smallCircleFrame)
          .offset(x: -smallCircleOffsetX)
        Circle()
          .foregroundStyle(Color("tkGreen"))
          .frame(width: smallCircleFrame)
          .offset(x: smallCircleOffsetX)
        Circle()
          .foregroundStyle(Color("tkRed"))
          .frame(width: mediumCircleFrame)
          .offset(x: -mediumCircleOffsetX)
        Circle()
          .foregroundStyle(Color("tkRed"))
          .frame(width: mediumCircleFrame)
          .offset(x: mediumCircleOffsetX)
        CircularStar()
          .foregroundStyle(Color("tkYellow"))
          .frame(width: largeCircleFrame, height: largeCircleFrame)
          .shadow(color: .black.opacity(largeCircleShadowOpacity), radius: largeCircleShadowRadius)
        CircularStar()
          .stroke(.white.opacity(largeCircleStrokeOpacity))
          .frame(width: largeCircleFrame, height: largeCircleFrame)
        AbilityScoreFlourish(content: abilityScore)
      }
      AbilityTitle(content: abilityTitle)
        .offset(x: 0, y: -125)
    }
  }
}

struct AbilityLandscapeFlourish: View {
  let abilityScore: Int
  let abilityTitle: String
  let largeCircleFrame = CGFloat(200)
  let largeCircleShadowOpacity = 0.25
  let largeCircleShadowRadius = CGFloat(50)
  let largeCircleStrokeOpacity = 0.8
  let flourishShadowOpacity = 0.4
  let flourishShadowRadius = CGFloat(20)
  let abilityScorePadding = CGFloat(5)
  let abilityTitlePadding = CGFloat(-100)

  var body: some View {
    ZStack {
      Group {
        CircularStar()
          .foregroundStyle(Color("tkYellow"))
          .frame(width: largeCircleFrame, height: largeCircleFrame)
          .shadow(color: .black.opacity(largeCircleShadowOpacity), radius: largeCircleShadowRadius)
        CircularStar()
          .stroke(.white.opacity(largeCircleStrokeOpacity))
          .frame(width: largeCircleFrame, height: largeCircleFrame)
      }
      .shadow(color: .black.opacity(flourishShadowOpacity), radius: flourishShadowRadius)
      AbilityScoreFlourish(content: abilityScore)
        .padding(.top, abilityScorePadding)
      AbilityTitle(content: abilityTitle)
        .frame(width: 250)
        .padding(.top, abilityTitlePadding)
    }
  }
}

struct AbilityAdjustmentPortraitFlourish: View {
  let characterClass: String
  let xpBonus: String
  let abilityTitle: String
  @Binding var pointsPool: Int
  let triangleFrame = CGFloat(200)
  let triangleAngle = 180.0
  let triangleOuterOffsetX = CGFloat(175)
  let triangleInnerOffsetX = CGFloat(75)
  let hexagonFrameWidth = CGFloat(200)
  let hexagonFrameHeight = CGFloat(250)
  let hexagonShadowOpacity = 0.25
  let hexagonShadowRadius = CGFloat(50)
  let hexagonStrokeOpacity = 0.8
  let bottomTitlePadding = CGFloat(100)
  let flourishShadowOpacity = 0.4
  let flourishShadowRadius = CGFloat(20)
  let topTitlePadding = CGFloat(155)
  let xpBonusPadding = CGFloat(-30)
  let pointsPoolPadding = CGFloat(175)

  var body: some View {
    ZStack {
      Group {
        Triangle()
          .foregroundStyle(Color("tkRed"))
          .frame(width: triangleFrame, height: triangleFrame)
          .offset(x: -triangleOuterOffsetX)
        Triangle()
          .foregroundStyle(Color("tkYellow"))
          .frame(width: triangleFrame, height: triangleFrame)
          .offset(x: -triangleInnerOffsetX)
        Triangle()
          .foregroundStyle(Color("tkRed"))
          .rotationEffect(Angle(degrees: triangleAngle))
          .frame(width: triangleFrame, height: triangleFrame)
          .offset(x: triangleOuterOffsetX)
        Triangle()
          .foregroundStyle(Color("tkYellow"))
          .rotationEffect(Angle(degrees: triangleAngle))
          .frame(width: triangleFrame, height: triangleFrame)
          .offset(x: triangleInnerOffsetX)
        Hexagon()
          .foregroundStyle(Color("tkGreen"))
          .frame(width: hexagonFrameWidth, height: hexagonFrameHeight)
          .shadow(color: .black.opacity(hexagonShadowOpacity), radius: hexagonShadowRadius)
        Hexagon()
          .stroke(.white.opacity(hexagonStrokeOpacity))
          .frame(width: hexagonFrameWidth, height: hexagonFrameHeight)
        AbilityTitle(content: "XP Bonus")
          .padding(.top, bottomTitlePadding)
      }
      .shadow(color: .black.opacity(flourishShadowOpacity), radius: flourishShadowRadius)
      AbilityTitle(content: characterClass)
        .padding(.bottom, topTitlePadding)
      AbilityAdjustmentFlourish(content: xpBonus)
        .padding(.top, xpBonusPadding)
      Text("**Points Pool:** \(pointsPool)")
        .font(.title2)
        .padding(.top, pointsPoolPadding)
    }
  }
}

struct AbilityAdjustmentLandscapeFlourish: View {
  let characterClass: String
  let xpBonus: String
  let abilityTitle: String
  @Binding var pointsPool: Int
  let hexagonFrameWidth = CGFloat(200)
  let hexagonFrameHeight = CGFloat(250)
  let hexagonShadowOpacity = 0.25
  let hexagonShadowRadius = CGFloat(50)
  let hexagonStrokeOpacity = 0.8
  let bottomTitlePadding = CGFloat(100)
  let flourishShadowOpacity = 0.4
  let flourishShadowRadius = CGFloat(20)
  let topTitlePadding = CGFloat(155)
  let xpBonusPadding = CGFloat(-30)
  let pointsPoolPadding = CGFloat(175)

  var body: some View {
    ZStack {
      Group {
        Hexagon()
          .foregroundStyle(Color("tkGreen"))
          .frame(width: hexagonFrameWidth, height: hexagonFrameHeight)
          .shadow(color: .black.opacity(hexagonShadowOpacity), radius: hexagonShadowRadius)
        Hexagon()
          .stroke(.white.opacity(hexagonStrokeOpacity))
          .frame(width: hexagonFrameWidth, height: hexagonFrameHeight)
        AbilityTitle(content: "XP Bonus")
          .padding(.top, bottomTitlePadding)
      }
      .shadow(color: .black.opacity(flourishShadowOpacity), radius: flourishShadowRadius)
      AbilityTitle(content: characterClass)
        .padding(.bottom, topTitlePadding)
      AbilityAdjustmentFlourish(content: xpBonus)
        .padding(.top, xpBonusPadding)
      Text("**Points Pool:** \(pointsPool)")
        .font(.title2)
        .padding(.top, pointsPoolPadding)
    }
  }
}

#Preview("Ability Portrait Flourish") {
  AbilityPortraitFlourish(abilityScore: 18, abilityTitle: "Strength")
}

#Preview("Ability Landscape Flourish") {
  AbilityLandscapeFlourish(abilityScore: 18, abilityTitle: "Intelligence")
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
