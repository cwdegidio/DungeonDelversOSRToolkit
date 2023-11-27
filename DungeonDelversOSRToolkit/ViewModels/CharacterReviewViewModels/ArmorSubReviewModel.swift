//
//  ArmorSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class ArmorSubReviewModel {
  func getArmor(for player: PlayerCharacter) -> String {
    var armorString = ""

    if let armor = player.armor {
      armorString += "\(armor.name)(AC: \(armor.armorClass))"
    }

    if player.hasShield {
      armorString += ", Shield"
    }

    if armorString.isEmpty {
      armorString = "None"
    }

    return armorString
  }
}
