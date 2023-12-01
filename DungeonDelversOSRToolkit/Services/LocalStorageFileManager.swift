//
//  LocalStorageFileManager.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import Foundation

class LocalStorageFileManager {
  static let fileManagerInstance = LocalStorageFileManager()

  func saveCharacterData(player: PlayerCharacter, name: String) -> Bool {
    guard let fileURL = getJSONFileURL(name: name) else {
      print("[ DEBUG ] Unable to get json file path")
      return false
    }
    print("[ DEBUG ] " + fileURL.absoluteString)

    do {
      let encoder = JSONEncoder()
      let jsonString = try encoder.encode(player)
      try jsonString.write(to: fileURL)
      return true
    } catch {
      print("[ DEBUG ] Unable to save data")
      print("\(error)")
      return false
    }
  }

  func getJSONFileURL(name: String) -> URL? {
    guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
      print("[ DEBUG ] Unable to get document directory.")
      return nil
    }

    let path = documentDirectory.appendingPathComponent("\(name).json")

    return path
  }

  func getAllCharacters() -> [PlayerCharacter]? {
    var localVaultList: [PlayerCharacter] = []

    guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
      print("[ DEBUG ] Unable to get document directory.")
      return nil
    }

    do {
      let charactersURLs =
      try FileManager.default.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
      print("[ DEBUG ] \(documentDirectory)")

      for characterURL in charactersURLs {
        let characterData = try Data(contentsOf: characterURL)
        let thisCharacter = try JSONDecoder().decode(PlayerCharacter.self, from: characterData)
        localVaultList.append(thisCharacter)
      }
      print("[DEBUG] localValutList: \(localVaultList)")
    } catch {
      print("[ DEBUG ] Cannot retrieve local character vault contents.")
      print("\(error)")
      return nil
    }

    return localVaultList
  }
}
