//
//  EquipmentViewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import Foundation

class EquipmentViewModel {
  func calculateWeight(for player: PlayerCharacter) -> Int {
    var totalWeight = 0
    // coinage
    for coin in player.coins {
      totalWeight += coin.value
    }

    // armor + shield
    if let armor = player.armor {
      totalWeight += armor.weight
    }

    if player.hasShield {
      totalWeight += Armor.shield.weight
    }

    // Weapons
    for weapon in player.weapons {
      totalWeight += weapon.weight
    }

    // We don't calculate ammo becuase it is included in weight of missile weapon
    // We don't calculate gear as the game considers that negligible

    return totalWeight
  }

  func isPurchasable(item: any Purchasable, for player: PlayerCharacter) -> Bool {
    if let currentGold = player.coins[.goldPieces], currentGold >= item.cost {
      return true
    }
    return false
  }

  func isPurchasableRefundable(item: any Purchasable, for player: PlayerCharacter) -> Bool {
    // Can we get a refund on Armor?
    if let armor = item as? Armor {
      if armor == .shield && player.hasShield == true {
        return true
      }

      if armor == player.armor {
        return true
      }
    }

    // ... weapons?
    if let weapon = item as? Weapon {
      return player.weapons.contains { $0 == weapon }
    }

    // ... ammo?
    if let ammo = item as? Ammo {
      return player.ammo.contains { $0 == ammo }
    }

    // ... gear?
    if let gear = item as? Gear {
      return player.gear.contains { $0 == gear }
    }

    return false
  }

  func refundCostOfPurchasable(item: any Purchasable, for player: PlayerCharacter) {
    if let armor = item as? Armor {
      if armor == .shield {
        player.hasShield = false
      } else {
        player.armor = nil
      }
    }

    // weapons
    if let weapon = item as? Weapon {
      player.weapons.removeAll { $0 == weapon }
    }

    // ammo
    if let ammo = item as? Ammo {
      player.ammo.removeAll { $0 == ammo }
    }

    // gear
    if let gear = item as? Gear {
      player.gear.removeAll { $0 == gear }
    }

    // refund the item
    if let currentGold = player.coins[.goldPieces] {
      player.coins.updateValue(currentGold + item.cost, forKey: .goldPieces)
    }
  }

  func purchaseItem(item: any Purchasable, for player: PlayerCharacter) {
    if let armor = item as? Armor {
      purchaseArmor(armor: armor, for: player)
    }

    if let weapon = item as? Weapon {
      purchaseWeapon(weapon: weapon, for: player)
    }

    if let ammo = item as? Ammo {
      purchaseAmmo(ammo: ammo, for: player)
    }

    if let gear = item as? Gear {
      purchaseGear(gear: gear, for: player)
    }
  }

  private func purchaseArmor(armor: Armor, for player: PlayerCharacter) {
    if let goldPieces = player.coins[.goldPieces], goldPieces >= armor.cost {
      if armor == Armor.shield {
        player.hasShield = true
      } else {
        player.armor = armor
      }
      player.coins.updateValue(goldPieces - armor.cost, forKey: .goldPieces)
    }
  }

  private func purchaseWeapon(weapon: Weapon, for player: PlayerCharacter) {
    if let goldPieces = player.coins[.goldPieces], goldPieces >= weapon.cost {
      player.weapons.append(weapon)
      player.coins.updateValue(goldPieces - weapon.cost, forKey: .goldPieces)
    }
  }

  private func purchaseAmmo(ammo: Ammo, for player: PlayerCharacter) {
    if let goldPieces = player.coins[.goldPieces], goldPieces >= ammo.cost {
      player.ammo.append(ammo)
      player.coins.updateValue(goldPieces - ammo.cost, forKey: .goldPieces)
    }
  }

  private func purchaseGear(gear: Gear, for player: PlayerCharacter) {
    if let goldPieces = player.coins[.goldPieces], goldPieces >= gear.cost {
      player.gear.append(gear)
      player.coins.updateValue(goldPieces - gear.cost, forKey: .goldPieces)
    }
  }
}
