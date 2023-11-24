//
//  SDVentriloquism.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDVentriloquism: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Ventriloquism")
        Text("**Duration:** 2 turns")
        Text("**Range:** 60'")
          .padding(.bottom, 20)
        Text("The caster may make their voice appear to come from any location or source (e.g. a statue or animal) within range.")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDVentriloquism()
}
