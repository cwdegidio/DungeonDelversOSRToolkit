//
//  MovementSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class MovementSubReviewModel {
  func getMovement(for movementType: Movement, using player: PlayerCharacter) -> ReviewItemModel {
    let baseMovement = getBaseMovementRate(for: player)
    var multiplier = 0.00

    switch movementType {
    case .overland:
      multiplier = 0.2
    case .exploration:
      multiplier = 1
    case .encounter:
      multiplier = 0.33
    }

    let movementRate = Int(ceil(baseMovement * multiplier))
    return ReviewItemModel(name: movementType.name, valueInt: movementRate, subText: movementType.description)
  }

  private func getBaseMovementRate(for player: PlayerCharacter) -> Double {
    let weight = EquipmentViewModel().calculateWeight(for: player)

    var baseMovement = 0.0
    if weight >= 0 && weight <= 400 {
      baseMovement = 120.0
    } else if weight >= 401 && weight <= 600 {
      baseMovement = 90.0
    } else if weight >= 601 && weight <= 800 {
      baseMovement = 60.0
    } else if weight >= 801 {
      baseMovement = 30.0
    }

    return baseMovement
  }
}
