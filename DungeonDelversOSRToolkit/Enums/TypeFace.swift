//
//  TypeFace.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

enum TypeFace {
  case die4
  case die6
  case die8
  case die10
  case die12
  case die20

  var name: String {
    switch self {
    case .die4:
      return "Art'sPolyhedralDiceD4Rounded"
    case .die6:
      return "Art'sPolyhedralDiceD6"
    case .die8:
      return "Art'sPolyhedralDiceD8"
    case .die10:
      return "Art'sPolyhedralDiceD10"
    case .die12:
      return "Art'sPolyhedralDiceD12"
    case .die20:
      return "Art'sPolyhedralDiceD20"
    }
  }
}
