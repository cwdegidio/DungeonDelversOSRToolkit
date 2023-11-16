//
//  ModCalculator.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/16/23.
//

import Foundation

struct ModCalculator {
  func  getValue(for modifier: Modifier, using score: Int) -> Int {
    let modType = modifier.modType

    switch modType {
    case .melee, .armorClass, .missile, .hitPoints, .magicSaves:
      return self.standardResult(for: score)
    case .initiative, .npcReaction:
      return self.secondaryResult(for: score)
    case .openDoors:
      return self.openDoors(for: score)
    case .spokenLanguage:
      return self.spokenLanguages(for: score)
    case .literacy:
      return self.literacy(for: score)
    case .retainerMax:
      return self.retainerMax(for: score)
    case .retainerLoyalty:
      return self.retainerLoyalty(for: score)
    }
  }

  private func standardResult(for score: Int) -> Int {
    switch score {
    case 3:
      return -3
    case 4...5:
      return -2
    case 6...8:
      return -1
    case 9...12:
      return 0
    case 13...15:
      return 1
    case 16...17:
      return 2
    case 18:
      return 3
    default:
      return -3
    }
  }

  private func secondaryResult(for score: Int) -> Int {
    switch score {
    case 3:
      return -2
    case 4...8:
      return -1
    case 9...12:
      return 0
    case 13...17:
      return 1
    case 18:
      return 2
    default:
      return -2
    }
  }

  private func openDoors(for score: Int) -> Int {
    switch score {
    case 3...8:
      return 1
    case 9...12:
      return 2
    case 13...15:
      return 3
    case 16...17:
      return 4
    case 18:
      return 5
    default:
      return 1
    }
  }

  private func spokenLanguages(for score: Int) -> Int {
    switch score {
    case 3:
      return SpokenLanguage.nativeBroken.rawValue
    case 4...12:
      return SpokenLanguage.native.rawValue
    case 13...15:
      return SpokenLanguage.nativePlus1.rawValue
    case 16...17:
      return SpokenLanguage.nativePlus2.rawValue
    case 18:
      return SpokenLanguage.nativePlus3.rawValue
    default:
      return SpokenLanguage.nativeBroken.rawValue
    }
  }

  private func literacy(for score: Int) -> Int {
    switch score {
    case 3...5:
      return Literacy.illiterate.rawValue
    case 6...8:
      return Literacy.basic.rawValue
    case 9...18:
      return Literacy.literate.rawValue
    default:
      return Literacy.illiterate.rawValue
    }
  }

  private func retainerMax(for score: Int) -> Int {
    switch score {
    case 3:
      return 1
    case 4...5:
      return 2
    case 6...8:
      return 3
    case 9...12:
      return 4
    case 13...15:
      return 5
    case 16...17:
      return 6
    case 18:
      return 7
    default:
      return 1
    }
  }

  private func retainerLoyalty(for score: Int) -> Int {
    switch score {
    case 3:
      return 4
    case 4...5:
      return 5
    case 6...8:
      return 6
    case 9...12:
      return 7
    case 13...15:
      return 8
    case 16...17:
      return 9
    case 18:
      return 10
    default:
      return 4
    }
  }

  // swiftlint:disable cyclomatic_complexity
  // Disabled to keep XP Adjustment calculations together in one method.
  func calculateXPAdjustment(for player: PlayerCharacter) -> Int {
    let singlePrimeReqStatClasses: [CharacterClass] = [.cleric, .dwarf, .fighter, .magicUser, .thief]
    var bonus = 0

    if singlePrimeReqStatClasses.contains(where: { aClass in aClass == player.characterClass }) {
      let score = player.abilityScores.first { $0.statType == player.characterClass?.primeRequisite[0] }?.score ?? 0

      switch score {
      case 3...5:
        bonus = -20
      case 6...8:
        bonus = -10
      case 9...12:
        bonus = 0
      case 13...15:
        bonus = 5
      case 16...18:
        bonus = 10
      default:
        bonus = -20
      }
    }

    if player.characterClass == CharacterClass.elf {
      let strScore = player.abilityScores.first { $0.statType == Stat.str }?.score ?? 0
      let intScore = player.abilityScores.first { $0.statType == Stat.int }?.score ?? 0

      if strScore >= 13 {
        if intScore >= 16 {
          bonus = 10
        } else if intScore >= 13 {
          bonus = 5
        }
      }
    }

    if player.characterClass == CharacterClass.halfling {
      let strScore = player.abilityScores.first { $0.statType == Stat.str }?.score ?? 0
      let dexScore = player.abilityScores.first { $0.statType == Stat.dex }?.score ?? 0

      if dexScore >= 13 && strScore >= 13 {
        bonus = 10
      } else if dexScore >= 13 || strScore >= 13 {
        bonus = 5
      }
    }

    return bonus
  }
  // swiftlint:enable cyclomatic_complexity
}
