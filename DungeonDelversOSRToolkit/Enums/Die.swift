//
//  Die.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/19/23.
//

import Foundation

enum Die {
  case die4
  case die6
  case die8
  case die10
  case die12
  case die20

  var description: String {
    switch self {
    case .die4:
      return "d4"
    case .die6:
      return "d6"
    case .die8:
      return "d8"
    case .die10:
      return "d10"
    case .die12:
      return "d12"
    case .die20:
      return "d20"
    }
  }

  // For use with Art's Polyhedral Dice Font
  var dieFaces: [String] {
    switch self {
    case .die4:
      return ["A", "D", "G", "J"]
    case .die6:
      return ["A", "B", "C", "D", "E", "F"]
    case .die8:
      return ["A", "B", "C", "D", "E", "F", "G", "H"]
    case .die10:
      return ["A", "B", "C", "D", "E", "F", "G", "H", "I", "K"]
    case .die12:
      return ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
    case .die20:
      return ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"]
    }
  }

  // For use with Art's Polyhedral Dice Font
  var typeFace: TypeFace {
    switch self {
    case .die4:
      return .die4
    case .die6:
      return .die6
    case .die8:
      return .die8
    case .die10:
      return .die10
    case .die12:
      return .die12
    case .die20:
      return .die20
    }
  }

  // For use with Art's Polyhedral Dice Font
  var baselineOffset: Double {
    switch self {
    case .die4:
      return 55.0
    case .die6:
      return -15.0
    case .die8:
      return -15.0
    case .die10:
      return -15.0
    case .die12:
      return -15.0
    case .die20:
      return -15.0
    }
  }
}
