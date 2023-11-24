//
//  WeaponDetail.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import SwiftUI

struct WeaponDetail: View {
  let weapon: Weapon
  
  var body: some View {
    Text(weapon.name)
  }
}

#Preview {
  WeaponDetail(weapon: .sword)
}
