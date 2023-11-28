//
//  CloudDataManager.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/28/23.
//

import Foundation

class CloudDataManager {
  static let cloudManagerInstance = CloudDataManager()
  
  enum CloudDataManagerErrors: Error {
    case invalidUrl
    case requestFailed
    case invalidStatusCode
  }

  func fetchCharactersFromCloud() async throws -> [PlayerCharacter] {
    let urlString = "http://localhost:8080/api/v1/characters"

    guard let url = URL(string: urlString) else {
      throw CloudDataManagerErrors.invalidUrl
    }

    var request = URLRequest(url: url)

    let (data, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse else {
      throw CloudDataManagerErrors.requestFailed
    }

    guard httpResponse.statusCode == 200 else {
      print("[ DEBUG ] HTTP Status Code: \(httpResponse.statusCode)")
      throw CloudDataManagerErrors.invalidStatusCode
    }

    do {
      let results = try JSONDecoder().decode(ResponseModel.self, from: data)
      print("[ DEBUG ] results")
      return results.playerCharacters
    } catch {
      print("[ DEBUG ] unknown error \(error.localizedDescription)")
      return []
    }
  }

  func saveCharacterToCloud(player: PlayerCharacter) async throws {
    let urlString = "http://localhost:8080/api/v1/character"

    guard let url = URL(string: urlString) else {
      throw CloudDataManagerErrors.invalidUrl
    }

    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    let encoder = JSONEncoder()
    let data = try encoder.encode(player)
    request.httpBody = data
    let (responseData, response) = try await URLSession.shared.upload(for: request, from: data)
  }
}
