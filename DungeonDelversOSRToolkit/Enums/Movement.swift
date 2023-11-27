//
//  Movement.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

enum Movement: CaseIterable {
  case overland
  case exploration
  case encounter

  var name: String {
    switch self {
    case .overland:
      return "Ov"
    case .exploration:
      return "Ex"
    case .encounter:
      return "En"
    }
  }

  var description: String {
    switch self {
    case .overland:
      return "Overland: 1/5 base mv. rate (miles/day)"
    case .exploration:
      return "Exploration: base mv. rate (feet/turn)"
    case .encounter:
      return "Encounter: 1/3 base mv. rate (feet/round)"
    }
  }
}
