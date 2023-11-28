//
//  NewCharacterView.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import SwiftUI

struct NewCharacterView: View {
  @EnvironmentObject var screen: ApplicationScreen
  @StateObject var player = PlayerCharacter()

  var body: some View {
    switch screen.currentScreen {
    default:
      Abilities()
        .environmentObject(player)
        .environmentObject(screen)
    }
  }
}


#Preview {
  let screen = ApplicationScreen(currentScreen: .abilities)
  return NewCharacterView()
    .environmentObject(screen)
}
