//
//  WeaponsSubReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import Foundation

class WeaponsSubReviewModel {
  func getWeapons(for player: PlayerCharacter) -> [WeaponReviewModel] {
    var weapons: [WeaponReviewModel] = []

    for weapon in player.weapons {
      let thisWeapon = weaponFactory(for: weapon)
      weapons.append(thisWeapon)
    }

    return weapons
  }

  private func weaponFactory(for weapon: Weapon) -> WeaponReviewModel {
    let name = weapon.name
    let damage = "1\(weapon.damage.description)"
    let qualities = weapon.qualities.map { $0.name }
    let weight = "\(weapon.weight) coins"

    return WeaponReviewModel(name: name, damage: damage, weight: weight, qualities: qualities)
  }
}
