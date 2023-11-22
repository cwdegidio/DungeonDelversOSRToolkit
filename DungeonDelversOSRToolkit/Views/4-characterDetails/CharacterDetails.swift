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
  @State var hpRolled = false
  @State var conModifier: Int = 0
  @State var selectedAlignment: Alignment? = .law
  var startingGoldRange = 3...18
  var startingdGoldMultiplier = 10
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
  let counterMax = 20
  var animationTimer: Timer?

  var body: some View {
    ZStack {
      GlobalBackground()
      VStack {
        VStack(spacing: 20) {
          Text(label)
            .baselineOffset(baseline)
            .rotationEffect(Angle(degrees: angle))
            .font(Font.custom(fontFace, size: 250))
            .foregroundStyle(Color("tkRed"))
            .shadow(color: .black.opacity(0.8), radius: 2.5)
            .padding(.top, -40)
          HStack {
            Text("**Hit Points\(conBonusString):**")
              .font(.title2)
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
        Divider()
          .padding(.top, -20)
        VStack {
          HStack {
            Text("**Starting Gold:**")
              .font(.title2)
            Text("\(player.coins.first { $0.key == Coinage.goldPieces }?.value ?? 0)")
              .font(Font.system(size: 21.0, design: .monospaced))
          }
          SmallButton(label: "Roll", icon: "banknote.fill", bgColor: Color("tkGreen"), fgColor: Color.white) {
            let startingGold = Int.random(in: startingGoldRange) * startingdGoldMultiplier
            player.coins.updateValue(startingGold, forKey: .goldPieces)
          }
        }
        .padding(.horizontal, 20)
        Divider()
        VStack {
          Text("**Select Alignment**")
            .font(.title2)
          Picker("Alignment", selection: $selectedAlignment) {
            ForEach(Alignment.allCases, id: \.rawValue) { alignment in
              Text(alignment.name).tag(alignment as Alignment?)
            }
          }
          .padding(5)
          .pickerStyle(.segmented)
          .background(Color("tkBlue"))
          .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
          .onAppear {
            let fontStyles = [
              NSAttributedString.Key.foregroundColor: UIColor.white,
              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
            ]
            UISegmentedControl.appearance().setTitleTextAttributes(fontStyles, for: .selected)
            UISegmentedControl.appearance().setTitleTextAttributes(fontStyles, for: .normal)
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("tkYellow"))
          }
          .onChange(of: $selectedAlignment.wrappedValue) {
            if let newAlignment = selectedAlignment {
              player.alignment = newAlignment
              print("[ DEBUG ] Player Alignment: \(player.alignment?.name ?? "")")
            }
          }
          .padding()
        }

        Spacer()
        LargeButton(label: "Next Step: Starting Funds") {
          print("[ DEBUG ] ==== PLAYER STATS (Post Adjustment)====")
          for stat in player.abilityScores {
            print("[ DEBUG ] \(stat.statType.shortName): \(stat.score)")
          }
          print("[ DEBUG ] Hit Points: \(player.pcHitPoints)")
          print("[ DEBUG ] Gold Pieces: \(String(describing: player.coins[.goldPieces]))")
          dump(player)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
      }
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
  let player = PlayerCharacter()
  player.abilityScores = [
    CharacterAbility(statType: .str, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .dex, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .con, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .int, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .wis, score: Int.random(in: 3...18)),
    CharacterAbility(statType: .cha, score: Int.random(in: 3...18))
  ]
  player.characterClass = CharacterClass.fighter
  return CharacterDetails()
    .environment(player)
}
