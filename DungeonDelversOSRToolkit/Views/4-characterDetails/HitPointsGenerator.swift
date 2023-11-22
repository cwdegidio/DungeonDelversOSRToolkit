//
//  HitPointsGenerator.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/22/23.
//

import SwiftUI

struct HitPointsGenerator: View {
  @EnvironmentObject var player: PlayerCharacter
  @Binding var hpRolled: Bool
  @State var dieFaces: [String] = []
  @State var angle = 0.0
  @State var fontFace = TypeFace.die4.name
  @State private var counter = 0
  @State var conModifier: Int = 0
  @State var hpValue: Int = 0
  @State var label: String = "A"
  @State var baseline = 0.0
  let counterMax = 20
  var animationTimer: Timer?
  var conBonusString: String {
    if conModifier == 0 {
      return ""
    } else {
      if conModifier < 0 {
        return " - \(abs(conModifier))"
      } else {
        return " + \(conModifier)"
      }
    }
  }

  var body: some View {
    VStack(spacing: 20) {
      Text(label)
        .baselineOffset(baseline)
        .rotationEffect(Angle(degrees: angle))
        .font(Font.custom(fontFace, size: 250))
        .foregroundStyle(Color("tkRed"))
        .shadow(color: .black.opacity(0.8), radius: 2.5)
        .padding(.top, -40)
      HStack {
        Subtitle(content: MarkdownHelper.returnMarkdown(for: "**Hit Points\(conBonusString):**"))
        Text("\(hpRolled ? player.pcHitPoints : 0)")
          .font(Font.system(size: 21.0, design: .monospaced))
      }
      .padding(.top, -70)
      SmallButton(
        label: "Roll Hit Points",
        icon: "cross.vial.fill",
        bgColor: Color("tkBlue"),
        fgColor: Color.white
      ) {
        determineCharacterHitPoints()
        hpRolled = true
      }
      .padding(.top, -50)
    }
    .frame(height: 320)
    .padding(.horizontal, 20)
    .animation(.bouncy, value: label)
    .onAppear {
      fontFace = player.characterClass?.hitDie.typeFace.name ?? TypeFace.die4.name
      dieFaces = player.characterClass?.hitDie.dieFaces ?? Die.die4.dieFaces
      baseline = player.characterClass?.hitDie.baselineOffset ?? Die.die4.baselineOffset
      player.alignment = .law

      if let hpModifier = player.modifiers.first(where: { $0.modType == Mod.hitPoints }),
        let conScore = player.abilityScores.first(where: { $0.statType == .con })?.score {
        conModifier = ModCalculator().getValue(
          for: hpModifier,
          using: conScore
        )
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
        if hpValue + conModifier <= 0 {
          player.pcHitPoints = 1
        } else {
          player.pcHitPoints = hpValue + conModifier
        }
      }
    }
  }
}

#Preview {
  HitPointsGenerator(hpRolled: .constant(false))
    .environment(PlayerCharacter())
}
