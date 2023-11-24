//
//  Weapon.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import Foundation

enum Weapon: String, CaseIterable, Codable {
  case battleAxe
  case club
  case crossbow
  case dagger
  case handAxe
  case javelin
  case lance
  case longBow
  case mace
  case poleArm
  case shortBow
  case shortSword
  case silverDagger
  case sling
  case spear
  case staff
  case sword
  case twoHandedSword
  case warHammer

  var name: String {
    switch self {
    case .battleAxe:
      return "Battle axe"
    case .club:
      return "Club"
    case .crossbow:
      return "Crossbow"
    case .dagger:
      return "Dagger"
    case .handAxe:
      return "Hand axe"
    case .javelin:
      return "Javelin"
    case .lance:
      return "Lance"
    case .longBow:
      return "Long bow"
    case .mace:
      return "Mace"
    case .poleArm:
      return "Pole arm"
    case .shortBow:
      return "Short bow"
    case .shortSword:
      return "Short sword"
    case .silverDagger:
      return "Silver dagger"
    case .sling:
      return "Sling"
    case .spear:
      return "Spear"
    case .staff:
      return "Staff"
    case .sword:
      return "Sword"
    case .twoHandedSword:
      return "Two-handed sword"
    case .warHammer:
      return "War hammer"
    }
  }

  var cost: Int {
    switch self {
    case .javelin:
      return 1
    case .sling, .staff:
      return 2
    case .club, .dagger, .spear:
      return 3
    case .handAxe:
      return 4
    case .lance, .mace, .warHammer:
      return 5
    case .battleAxe, .poleArm, .shortSword:
      return 7
    case .sword:
      return 10
    case .twoHandedSword:
      return 15
    case .shortBow:
      return 25
    case .crossbow, .silverDagger:
      return 30
    case .longBow:
      return 40
    }
  }

  var weight: Int {
    switch self {
    case .dagger, .silverDagger:
      return 10
    case .javelin, .sling:
      return 20
    case .handAxe, .longBow, .mace, .shortBow, .shortSword, .spear, .warHammer:
      return 30
    case .staff:
      return 40
    case .battleAxe, .club, .crossbow:
      return 50
    case .sword:
      return 60
    case .lance:
      return 120
    case .poleArm, .twoHandedSword:
      return 150
    }
  }

  var damage: Die {
    switch self {
    case .club, .dagger, .javelin, .silverDagger, .sling, .staff:
      return .die4
    case .crossbow, .handAxe, .lance, .longBow, .mace, .shortBow, .shortSword, .spear, .warHammer:
      return .die6
    case .battleAxe, .sword:
      return .die8
    case .poleArm, .twoHandedSword:
      return .die10
    }
  }

  var qualities: [Quality] {
    switch self {
    case .battleAxe:
      return [.melee, .slow, .twoHanded]
    case .club:
      return [.blunt, .melee]
    case .crossbow:
      return [.missile, .reload, .slow, .twoHanded]
    case .dagger:
      return [.melee, .missile]
    case .handAxe:
      return [.melee, .missile]
    case .javelin:
      return [.missile]
    case .lance:
      return [.charge, .melee]
    case .longBow:
      return [.missile, .twoHanded]
    case .mace:
      return [.blunt, .melee]
    case .poleArm:
      return [.brace, .melee, .slow, .twoHanded]
    case .shortBow:
      return [.missile, .twoHanded]
    case .shortSword:
      return [.melee]
    case .silverDagger:
      return [.melee, .missile]
    case .sling:
      return [.blunt, .missile]
    case .spear:
      return [.brace, .melee, .missile]
    case .staff:
      return [.blunt, .melee, .slow, .twoHanded]
    case .sword:
      return [.melee]
    case .twoHandedSword:
      return [.melee, .slow, .twoHanded]
    case .warHammer:
      return [.blunt, .melee]
    }
  }

  var range: String {
    switch self {
    case .battleAxe, .club, .lance, .mace, .poleArm, .shortSword, .staff, .sword, .twoHandedSword, .warHammer:
      return "None"
    case .dagger, .handAxe, .silverDagger:
      return "(5'-10' / 11'-20' / 21'-30')"
    case .spear:
      return "(5'–20' / 21'–40' / 41'–60')"
    case .javelin:
      return "(5'-30' / 31'-60' / 61'-90')"
    case .shortBow:
      return "(5'–50' / 51'–100' / 101'–150')"
    case .sling:
      return "(5'–40' / 41'–80' / 81'–160')"
    case .longBow:
      return "(5'–70' / 71'–140' / 141'–210')"
    case .crossbow:
      return "(5'–80' / 81'–160' / 161'–240')"
    }
  }
}

enum Quality: String, Codable {
  case blunt
  case brace
  case charge
  case melee
  case missile
  case reload
  case slow
  case twoHanded

  var name: String {
    switch self {
    case .blunt:
      return "Blunt"
    case .brace:
      return "Brace"
    case .charge:
      return "Charge"
    case .melee:
      return "Melee"
    case .missile:
      return "Missile"
    case .reload:
      return "Reload"
    case .slow:
      return "Slow"
    case .twoHanded:
      return "Two-handed"
    }
  }
}
