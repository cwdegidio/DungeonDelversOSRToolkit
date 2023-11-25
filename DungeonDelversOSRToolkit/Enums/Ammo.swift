//
//  Ammo.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import Foundation

enum Ammo: String, Purchasable, CaseIterable, Codable {
  case arrows
  case crossbowBolts
  case silverTippedArrow
  case slingStones

  var name: String {
    switch self {
    case .arrows:
      return "Arrows (quiver of 20)"
    case .crossbowBolts:
      return "Crossbow Bolts (case of 30)"
    case .silverTippedArrow:
      return "Silver tipped arrows (1)"
    case .slingStones:
      return "Sling stones"
    }
  }

  var cost: Int {
    switch self {
    case .slingStones:
      return 0
    case .arrows, .silverTippedArrow:
      return 5
    case .crossbowBolts:
      return 10
    }
  }

  var imgName: String {
    switch self {
    case .arrows:
      return "amArrows"
    case .crossbowBolts:
      return "amCrossbowBolt"
    case .silverTippedArrow:
      return "amSilverTippedArrow"
    case .slingStones:
      return "amSlingStones"
    }
  }
}
