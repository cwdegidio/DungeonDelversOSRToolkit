//
//  Armor.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import Foundation

enum Armor: String, CaseIterable, Codable {
  case leather
  case chainmail
  case plateMail
  case shield

  var name: String {
    switch self {
    case .leather:
      return "Leather"
    case .chainmail:
      return "Chainmail"
    case .plateMail:
      return "Plate mail"
    case .shield:
      return "Shield"
    }
  }

  var armorClass: Int {
    switch self {
    case .leather:
      return 7
    case .chainmail:
      return 5
    case .plateMail:
      return 3
    case .shield:
      return 1
    }
  }

  var cost: Int {
    switch self {
    case .leather:
      return 20
    case .chainmail:
      return 40
    case .plateMail:
      return 60
    case .shield:
      return 10
    }
  }

  var weight: Int {
    switch self {
    case .leather:
      return 200
    case .chainmail:
      return 400
    case .plateMail:
      return 500
    case .shield:
      return 100
    }
  }

  var imgName: String {
    switch self {
    case .leather:
      return "aLeather"
    case .chainmail:
      return "aChainmail"
    case .plateMail:
      return "aPlateMail"
    case .shield:
      return "aShield"
    }
  }

  var description: String {
    switch self {
    case .leather:
      return "Leather armor is a type of armor made primarily from hardened leather. " +
      "It has the advantage of being light and inexpensive, but provides less protection than heavier metal armors."
    case .chainmail:
      return "Chainmail is a common form of armor made of interlocking metal rings. " +
      "Clothing is typically worn underneath such an article to prevent chafing, bruising, and irritation."
    case .plateMail:
      return "Plate mail consists of shaped, interlocking plates. These plates cover the entire body. " +
      "Beneath the metal is a thick layer of padding and numerous straps and harnesses to distribute the weight."
    case .shield:
      return "Shields are usually made from wood or metal, and are used by combatants to gain extra protection. " +
      "Shields are carried in one hand, usually strapped to the arm that carries them."
    }
  }
}
