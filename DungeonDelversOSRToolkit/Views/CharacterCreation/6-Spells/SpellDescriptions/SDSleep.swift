//
//  SDSleep.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDSleep: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Sleep")
        Text("**Duration:** 4d4 turns")
        Text("**Range:** 240'")
          .padding(.bottom, 20)
        Text("A _sleep_ spell causes a magical slumber to come upon creatures, excluding the undead. The spell may target either:")
        BulletedText(content: "A single creature with 4+1 Hit Dice")
        BulletedText(content: "A total of 2d8 Hit Dice of creatures of 4 HD or lower each.")
        Text("When targeting creatures of 4 HD or less, the following rules apply:")
        BulletedText(content: "**Weakest first:** Targets with the least HD are affected first.")
        BulletedText(content: "**HD:** Treat monsters with less than 1 HD as having 1 HD and monsters with a fixed hit point bonus as having the flat HD. (For example, a 3+2 HD monster would be treated as having 3 HD.)")
        BulletedText(content: "**Excess:** Rolled Hit Dice that are not sufficient to affect a creature are wasted.")
        Text("**Killing:** Creatures enchanted by this spell are helpless and can be killed instantly with a bladed weapon.")
        Text("**Awakening:** Slapping or wounding awak- ens an affected creature.")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDSleep()
}
