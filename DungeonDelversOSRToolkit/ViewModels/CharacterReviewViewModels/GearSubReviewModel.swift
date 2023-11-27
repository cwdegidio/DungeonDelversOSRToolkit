//
//  GearSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class GearSubReviewModel {
  func getGear(for player: PlayerCharacter) -> [String] {
    let gearNames = player.gear.map { $0.name }
    return gearNames
  }
}
