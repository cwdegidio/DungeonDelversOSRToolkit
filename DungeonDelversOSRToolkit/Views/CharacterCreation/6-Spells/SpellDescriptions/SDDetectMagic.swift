//
//  SDDetectMagic.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDDetectMagic: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Detect Magic")
        Text("**Duration:** 2 turns")
        Text("**Range:** 60'")
          .padding(.bottom, 20)
        Text("Enchanted objects, areas, or creatures are caused to glow. Both permanent and temporary enchantments are revealed.")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDDetectMagic()
}
