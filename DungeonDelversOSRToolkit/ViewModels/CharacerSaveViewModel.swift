//
//  CharacerSaveViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import Foundation

class CharacerSaveViewModel {
  let manager = LocalStorageFileManager.fileManagerInstance
  let cloudManager = CloudDataManager.cloudManagerInstance

  func saveCharacterToDevice(for player: PlayerCharacter) -> Bool {
    let fileName = player.id.uuidString
    let success = manager.saveCharacterData(player: player, name: fileName)
    return success
  }

  func saveLocalCharacterToCloud(player: PlayerCharacter) {
    Task { @MainActor in
      try await cloudManager.saveCharacterToCloud(player: player)
    }
  }
}
