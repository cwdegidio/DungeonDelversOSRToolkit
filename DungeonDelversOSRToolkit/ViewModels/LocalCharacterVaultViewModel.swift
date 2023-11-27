//
//  LocalCharacterVaultViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import Foundation

class LocalCharacterVaultViewModel {
  let manager = LocalStorageFileManager.fileManagerInstance

  func getLocalCharacters() -> [PlayerCharacter]? {
    manager.getAllCharacters()
  }
}
