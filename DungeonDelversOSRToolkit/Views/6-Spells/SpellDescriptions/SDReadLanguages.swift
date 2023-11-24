//
//  SDReadLanguages.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDReadLanguages: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Read Languages")
        Text("**Duration:** 2 turns")
        Text("**Range:** The caster")
          .padding(.bottom, 20)
        Text("For the duration of this spell, the caster may read any language, coded message, map, or other set of written instructions. This spell does not grant any ability to _speak_ unknown languages.")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDReadLanguages()
}
