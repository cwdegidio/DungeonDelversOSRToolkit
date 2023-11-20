//
//  AbilityAdjustmentViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/18/23.
//

import Foundation

class AbilityAdjustmentViewModel {
  func getPrimeRequitsiteString(using player: PlayerCharacter) -> String {
    let statStrings = player.characterClass?.primeRequisite.map { stat in
      stat.name
    }

    return statStrings?.joined(separator: ", ") ?? "No Prime Requisites"
  }

  func getMaxScore(for thisStat: Stat, using player: PlayerCharacter) -> Int {
    return player.abilityScores.first { $0.statType == thisStat }?.score ?? 0
  }

  func getMinScore(for thisStat: Stat, isPrimeReq: Bool, using player: PlayerCharacter) -> Int {
    if isPrimeReq {
      return player.abilityScores.first { $0.statType == thisStat }?.score ?? 0
    } else {
      return 9
    }
  }

  func getIsPrimeReq(for thisStat: Stat, using player: PlayerCharacter) -> Bool {
    let primeReqs = player.characterClass?.primeRequisite ?? []

    return primeReqs.contains { aStat in aStat == thisStat }
  }

  func isStatAdjustable(for thisStat: Stat, using player: PlayerCharacter) -> Bool {
    let allowedStatTypes: [Stat] = [.str, .int, .wis]

    if allowedStatTypes.contains(where: { aStat in aStat == thisStat }) {
      return true
    } else if getIsPrimeReq(for: thisStat, using: player) {
      return true
    }

    return false
  }
}
