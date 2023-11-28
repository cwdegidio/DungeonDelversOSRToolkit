//
//  ResponseModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/28/23.
//

import Foundation

struct ResponseModel: Codable {
  var playerCharacters: [PlayerCharacter]

  enum CodingKeys: CodingKey {
    case playerCharacters
  }
}
