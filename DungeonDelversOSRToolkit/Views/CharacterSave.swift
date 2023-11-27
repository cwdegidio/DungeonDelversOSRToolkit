//
//  CharacterSave.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import SwiftUI

struct CharacterSave: View {
  @EnvironmentObject var player: PlayerCharacter
  @EnvironmentObject var screen: ApplicationScreen
  @State var showLocalSaveAlert = false
  @State var localSaveSuccess = false
  let viewModel = CharacerSaveViewModel()
  var localSuccessMessage: String {
    "\(player.name) has been saved to local character vault"
  }
  var localFailMessage: String {
    "Unable to save \(player.name) to local character vault"
  }

  var body: some View {
    ZStack {
      GlobalBackground()
      VStack {
        Subtitle(content: "Choose a save location:")
        SmallButton(label: "Save to Device", icon: "iphone", bgColor: Color("tkBlue"), fgColor: .white) {
          localSaveSuccess = viewModel.saveCharacterToDevice(for: player)
          showLocalSaveAlert = true
        }
        .padding(.bottom, 10)
        .alert(localSaveSuccess ? localSuccessMessage : localFailMessage, isPresented: $showLocalSaveAlert) {
              Button("OK", role: .cancel) { }
          }
        SmallButton(label: "Save to Dungeon Cloud", icon: "cloud.fill", bgColor: Color("tkBlue"), fgColor: .white) {
          print("[ DEBUG ] Save To Cloud")
        }
        .padding(.bottom, 10)
        LargeButton(label: localSaveSuccess ? "Return to Home" : "Abandon Character and Return Home") {
          print("[ DEBUG ] Go To Home")
        }
      }
      .padding()
    }
  }
}

#Preview {
  let player = PlayerCharacter()
  return CharacterSave()
    .environment(player)
}
