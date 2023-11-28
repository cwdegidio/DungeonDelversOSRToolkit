//
//  CharacterManagementView.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import SwiftUI

struct CharacterManagementView: View {
  @EnvironmentObject var screen: ApplicationScreen
  @EnvironmentObject var review: ReviewModel


  var body: some View {
    switch screen.currentScreen {
    default:
      LocalCharacterVault()
        .environmentObject(screen)
    }
  }
}

#Preview {
  let screen = ApplicationScreen(currentScreen: .localCharacterVault)
  return CharacterManagementView()
    .environmentObject(screen)
}
