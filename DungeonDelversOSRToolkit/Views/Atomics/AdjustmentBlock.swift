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

  var body: some View {
    ZStack {
      RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
        .stroke(.black, lineWidth: 5)
        .fill(Color("tkGreen"))
        .frame(height: 60)
        .shadow(color: .black.opacity(0.8), radius: 2.5)
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
              .bold()
              .font(.subheadline)
            Text("\(maxScore)")
              .fontDesign(.rounded)
          }
          HStack(alignment: .center) {
            Text("Adjusted Score:")
              .bold()
              .font(.subheadline)
            Text("\(charAbility.score)")
              .fontDesign(.rounded)
          }
        }
        Spacer()
        HStack {
          AdjustmentButton(symbolName: "plus", color: Color("tkBlue"), isDisabled: disableAddButton()) {
            print("add action fired")
            if isPrimeReq {
              charAbility.score += 1
            } else {
              charAbility.score += 2
            }

            pointsPool -= 2
          }
          .padding(.trailing, 20)
          AdjustmentButton(symbolName: "minus", color: Color("tkRed"), isDisabled: disableSubtractButton()) {
            print("subtract action fired")
            if isPrimeReq {
              charAbility.score -= 1
            } else {
              charAbility.score -= 2
            }

            pointsPool += 2
          }
        }
      }
      .padding(.horizontal, 20)
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
