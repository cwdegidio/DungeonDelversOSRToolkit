//
//  Coinage.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/19/23.
//

import Foundation

enum Coinage: String, Codable {
  case platinumPieces
  case goldPieces
  case electrumPieces
  case silverPieces
  case copperPieces

  var shortName: String {
    switch self {
    case .platinumPieces:
      return "pp"
    case .goldPieces:
      return "gp"
    case .electrumPieces:
      return "ep"
    case .silverPieces:
      return "sp"
    case .copperPieces:
      return "cp"
    }
  }

  var name: String {
    switch self {
    case .platinumPieces:
      return "platinum pieces"
    case .goldPieces:
      return "gold pieces"
    case .electrumPieces:
      return "electrum pieces"
    case .silverPieces:
      return "silver pieces"
    case .copperPieces:
      return "copper pieces"
    }
  }
}
