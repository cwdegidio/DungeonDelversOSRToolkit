//
//  SDProtectionFromEvil.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDProtectionFromEvil: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Protection from Evil")
        Text("**Duration:** 6 turns")
        Text("**Range:** The caster")
          .padding(.bottom, 20)
        Text("This spell wards the caster from attacks by creatures of another alignment, as follows:")
        BulletedText(content: "**Bonuses:** The caster gains a +1 bonus to saving throws against attacks or special abilities of affected creatures.")
        BulletedText(content: "**Affected creatures’ attacks:** Against the caster are penalised by –1.")
        BulletedText(content: "**Enchanted, constructed, or summoned creatures:** The spell additionally prevents such creatures from attacking the caster in melee, though they may still make ranged attacks. If the caster engages such a creature in melee, this protection is broken (the caster still gains the save and attack bonuses mentioned above).")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDProtectionFromEvil()
}
