//
//  SDFloatingDisc.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDFloatingDisc: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Floating Disc")
        Text("**Duration:** 6 turns")
        Text("**Range:** 6'")
          .padding(.bottom, 20)
        Text("The caster conjures a slightly concave, circular disc of magical force that follows them about and carries loads.")
        BulletedText(content: "**Dimensions:** The disc is 3 feet in diameter and 1 inch deep at its center.")
        BulletedText(content: "**Load:** It can hold a maximum load of 5,000 coins (500 pounds).")
        BulletedText(content: "**Motion:** The disc floats at waist height and remains level, floating along horizontally within spell range.")
        BulletedText(content: "**End:** When the disc winks out at the end of the spell’s duration, anything it was supporting is dropped.")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDFloatingDisc()
}
