//
//  AdjustmentBlock.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/18/23.
//

import SwiftUI

struct AdjustmentBlock: View {
  @EnvironmentObject var player: PlayerCharacter
  @Binding var charAbility: Ability
  @Binding var pointsPool: Int
  @State var maxScore = 0
  @State var minScore = 0
  @State var isPrimeReq = false
  let viewModel: AbilityAdjustmentViewModel
  let maxPrimeReqScore = 18
  let primeReqPointValue = 1
  let standardPointValue = 2
  let pointPoolCost = 2
  let rectangleCornerSize = CGSize(width: 10, height: 10)
  let rectangleStrokeWidth = CGFloat(5)
  let rectangleFrameHeight = CGFloat(60)
  let rectangleShadowOpacity = 0.8
  let rectangleShadowRadius = CGFloat(2.5)

  var body: some View {
    ZStack {
      RoundedRectangle(cornerSize: rectangleCornerSize)
        .stroke(.black, lineWidth: rectangleStrokeWidth)
        .fill(Color("tkGreen"))
        .frame(height: rectangleFrameHeight)
        .shadow(color: .black.opacity(rectangleShadowOpacity), radius: rectangleShadowRadius)
      HStack {
        VStack(alignment: .leading) {
          let blockTitle = charAbility.statType.shortName
          Text("\(blockTitle)\(isPrimeReq ? "*" : "")")
            .font(.title2)
            .fontWeight(.bold)
        }
        Spacer()
        VStack(alignment: .leading) {
          HStack(alignment: .center) {
            Text("Starting Score:")
              .fontWeight(.bold)
              .font(.subheadline)
            Text("\(maxScore)")
              .fontDesign(.rounded)
          }
          HStack(alignment: .center) {
            Text("Adjusted Score:")
              .fontWeight(.bold)
              .font(.subheadline)
            Text("\(charAbility.score)")
              .fontDesign(.rounded)
          }
        }
        Spacer()
        HStack {
          AdjustmentButton(symbolName: "plus", color: Color("tkBlue"), isDisabled: disableAddButton()) {
            if isPrimeReq {
              charAbility.score += primeReqPointValue
            } else {
              charAbility.score += standardPointValue
            }

            pointsPool -= pointPoolCost
          }
          .padding(.trailing)
          AdjustmentButton(symbolName: "minus", color: Color("tkRed"), isDisabled: disableSubtractButton()) {
            if isPrimeReq {
              charAbility.score -= primeReqPointValue
            } else {
              charAbility.score -= standardPointValue
            }

            pointsPool += pointPoolCost
          }
        }
      }
      .padding(.horizontal)
    }
    .onAppear {
      isPrimeReq = viewModel.getIsPrimeReq(for: charAbility.statType, using: player)
      maxScore = viewModel.getMaxScore(for: charAbility.statType, using: player)
      minScore = viewModel.getMinScore(for: charAbility.statType, isPrimeReq: isPrimeReq, using: player)
    }
  }

  func disableAddButton() -> Bool {
    if pointsPool == 0 {
      return true
    } else if isPrimeReq {
      return charAbility.score >= maxPrimeReqScore
    } else {
      return charAbility.score >= maxScore
    }
  }

  func disableSubtractButton() -> Bool {
    if isPrimeReq {
      return charAbility.score <= minScore
    } else {
      return charAbility.score <= minScore + 1
    }
  }
}

#Preview {
  let charAbility = CharacterAbility(statType: .str, score: 15)

  let player = PlayerCharacter()
  for i in 0..<player.abilityScores.count {
    if player.abilityScores[i].statType == Stat.wis {
      player.abilityScores[i].score = 11
    } else {
      player.abilityScores[i].score = 18
    }
  }
  player.characterClass = .fighter

  return AdjustmentBlock(
    charAbility: .constant(charAbility),
    pointsPool: .constant(0),
    viewModel: AbilityAdjustmentViewModel()
  )
  .environment(player)
}
