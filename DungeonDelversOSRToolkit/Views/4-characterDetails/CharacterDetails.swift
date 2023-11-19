//
//  CharacterDetails.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/19/23.
//

import SwiftUI

struct CharacterDetails: View {
  @Environment(\.verticalSizeClass)
  var verticalSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var horizontalSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  @State var label: String = "A"
  @State var hpValue: Int = 0
  @State private var counter = 0
  @State var angle = 0.0
  @State var fontFace = TypeFace.die4.name
  @State var dieFaces: [String] = []
  @State var baseline = 0.0
  let counterMax = 20
  var animationTimer: Timer?

  var body: some View {
    ZStack {
      GlobalBackground()
      VStack(spacing: 40) {
        Text(label)
          .baselineOffset(baseline)
          .rotationEffect(Angle(degrees: angle))
          .font(Font.custom(fontFace, size: 250))
        Text("HP: \(hpValue)")

        Button("Change Text") {
          determineCharacterHitPoints()
        }
      }
      .animation(.bouncy, value: label)
      .onAppear {
        fontFace = player.characterClass?.hitDie.typeFace.name ?? TypeFace.die4.name
        dieFaces = player.characterClass?.hitDie.dieFaces ?? Die.die4.dieFaces
        baseline = player.characterClass?.hitDie.baselineOffset ?? Die.die4.baselineOffset
      }
    }
  }

  func determineCharacterHitPoints() {
    Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true) { timer in
      let value = Int.random(in: 0..<dieFaces.count)
      label = dieFaces[value]
      hpValue = value + 1
      angle = Double.random(in: 0...360)
      counter += 1

      if counter >= counterMax {
        timer.invalidate()
        counter = 0
        angle = 0
      }
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
  player.characterClass = CharacterClass.magicUser
  return CharacterDetails()
    .environment(player)
}
