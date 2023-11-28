//
//  SDMagicMissile.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDMagicMissile: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Magic Missile")
        Text("**Duration:** 1 turn")
        Text("**Range:** 150'")
          .padding(.bottom, 20)
        Text("This spell conjures a glowing dart of energy that the caster may choose to shoot at a visible target within range.")
        BulletedText(content: "**Hit:** The missile hits unerringly (no attack roll or saving throw is required).")
        BulletedText(content: "**Damage:** The missile inflicts 1d6+1 damage.")
        BulletedText(content: "**Higher level casters:** May conjure more missiles: two additional missiles are conjured per five experience levels the caster has gained (i.e. three missiles at 6th–10th level, five missiles at 11th–15th level, etc.). Multiple missiles may be directed at a single target.")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDMagicMissile()
}
