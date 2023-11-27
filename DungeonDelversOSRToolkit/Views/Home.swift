//
//  Home.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import SwiftUI

struct Home: View {
  @EnvironmentObject var screen: ApplicationScreen

  var body: some View {
    ZStack {
      GlobalBackground()
      VStack {
        Subtitle(content: "What would you like to do?")
        SmallButton(label: "Create a new character", icon: "dice.fill", bgColor: Color("tkGreen"), fgColor: Color.white) {
          screen.currentScreen = .abilities
        }
        .padding(.bottom, 10)
        SmallButton(label: "View local character vault", icon: "iphone", bgColor: Color("tkBlue"), fgColor: Color.white) {
          screen.currentScreen = .localCharacterVault
        }
        .padding(.bottom, 10)
        SmallButton(label: "View characters on Dungeon Cloud", icon: "cloud.fill", bgColor: Color("tkYellow"), fgColor: Color.white) {
          print("Create a new character")
        }
      }
      .padding()
    }
  }
}

#Preview {
  Home()
}
