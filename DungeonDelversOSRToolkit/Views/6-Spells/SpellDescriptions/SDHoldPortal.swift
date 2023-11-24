//
//  SDHoldPortal.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDHoldPortal: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Hold Portal")
        Text("**Duration:** 2d6 turns")
        Text("**Range:** 10'")
          .padding(.bottom, 20)
        Text("This spell magically holds shut a door, gate, window, or other kind of portal.")
        BulletedText(content: "**Opening by magic:** A _knock_ spell opens the held portal instantly.")
        BulletedText(content: "**Opening by force:** Creatures with at least 3 Hit Dice more than the caster can open the held portal with one round of effort.")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDHoldPortal()
}
