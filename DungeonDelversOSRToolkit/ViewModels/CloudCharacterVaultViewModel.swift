//
//  CloudCharacterVaultViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/28/23.
//

import Foundation

@MainActor
class CloudCharacterVaultViewModel: ObservableObject, Observable {
  @Published var characters: [PlayerCharacter] = []
  let manager = CloudDataManager.cloudManagerInstance

  func getLocalCharacters() async throws {
    Task { @MainActor in
      self.characters = try await manager.fetchCharactersFromCloud()
    }
  }
}
