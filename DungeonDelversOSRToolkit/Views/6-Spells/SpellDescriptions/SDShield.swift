//
//  SDShield.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDShield: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        Subtitle(content: "Shield")
        Text("**Duration:** 2 turns")
        Text("**Range:** The caster")
          .padding(.bottom, 20)
        Text("Creates an invisible field of force that gives the caster an improved AC:")
        BulletedText(content: "**Against missile attacks:** AC 2")
        BulletedText(content: "**Against other attacks:** AC 4")
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDShield()
}
