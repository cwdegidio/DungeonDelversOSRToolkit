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
  @State var showCloudSaveAlert = false
  @State var cloudSaveSuccess = false
  let viewModel = CharacerSaveViewModel()
  var localSuccessMessage: String {
    "\(player.name) has been saved to local character vault"
  }
  var localFailMessage: String {
    "Unable to save \(player.name) to local character vault"
  }
  var cloudSuccessMessage: String {
    "\(player.name) has been saved to Dragon Cloud"
  }
  var cloudFailMessage: String {
    "Unable to save \(player.name) to Dragon Cloud"
  }

  var body: some View {
    ZStack {
      GlobalBackground()
      VStack {
        Subtitle(content: "Choose a save location:")
        SmallButton(label: "Save to Device", icon: "iphone", bgColor: Color("tkBlue"), isDisabled: false) {
          localSaveSuccess = viewModel.saveCharacterToDevice(for: player)
          showLocalSaveAlert = true
        }
        .padding(.bottom, 10)
        .alert(localSaveSuccess ? localSuccessMessage : localFailMessage, isPresented: $showLocalSaveAlert) {
          Button("OK", role: .cancel) { }
        }
        SmallButton(label: "Save to Dungeon Cloud", icon: "cloud.fill", bgColor: Color("tkBlue"), isDisabled: false) {
          do {
            try viewModel.saveLocalCharacterToCloud(player: player)
            cloudSaveSuccess = true
          } catch {
            cloudSaveSuccess = false
          }
          showCloudSaveAlert = true
        }
        .alert(cloudSaveSuccess ? cloudSuccessMessage : cloudFailMessage, isPresented: $showCloudSaveAlert) {
          Button("OK", role: .cancel) { }
        }
        .padding(.bottom, 10)
        SmallButton(
          label: localSaveSuccess ? "Return to Home" : "Abandon Character and Return Home",
          icon: localSaveSuccess ? "cloud.fill" : "exclamationmark.triangle.fill",
          bgColor: localSaveSuccess ? Color("tkGreen") : Color("tkRed"),
          isDisabled: false
        ) {
          screen.currentScreen = .home
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
