//
//  MUSpell.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import Foundation
import SwiftUI

enum MUSpell: String, CaseIterable, Codable {
  case charmPerson
  case detectMagic
  case floatingDisc
  case holdPortal
  case light
  case magicMissile
  case protectionFromEvil
  case readLanguages
  case readMagic
  case shield
  case sleep
  case ventriloquism

  var name: String {
    switch self {
    case .charmPerson:
      return "Charm Person"
    case .detectMagic:
      return "Detect Magic"
    case .floatingDisc:
      return "Floating Disc"
    case .holdPortal:
      return "Hold Portal"
    case .light:
      return "Light"
    case .magicMissile:
      return "Magic Missile"
    case .protectionFromEvil:
      return "Protection from Evil"
    case .readLanguages:
      return "Read Languages"
    case .readMagic:
      return "Read Magic"
    case .shield:
      return "Shield"
    case .sleep:
      return "Sleep"
    case .ventriloquism:
      return "Ventriloquism"
    }
  }

  var descriptionView: AnyView {
    switch self {
    case .charmPerson:
      return AnyView(SDCharmPerson())
    case .detectMagic:
      return AnyView(SDDetectMagic())
    case .floatingDisc:
      return AnyView(SDFloatingDisc())
    case .holdPortal:
      return AnyView(SDHoldPortal())
    case .light:
      return AnyView(SDLight())
    case .magicMissile:
      return AnyView(SDMagicMissile())
    case .protectionFromEvil:
      return AnyView(SDProtectionFromEvil())
    case .readLanguages:
      return AnyView(SDReadLanguages())
    case .readMagic:
      return AnyView(SDReadMagic())
    case .shield:
      return AnyView(SDShield())
    case .sleep:
      return AnyView(SDSleep())
    case .ventriloquism:
      return AnyView(SDVentriloquism())
    }
  }
}
