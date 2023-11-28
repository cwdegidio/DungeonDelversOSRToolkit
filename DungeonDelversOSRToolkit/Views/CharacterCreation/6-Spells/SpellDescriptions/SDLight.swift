//
//  SDLight.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDLight: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Light")
        Text("**Duration:** 6 turns +1 per level")
        Text("**Range:** 120'")
          .padding(.bottom, 20)
        Text("This spell has three usages:")
        BulletedText(content: "**Conjuring light:** In a 15’ radius. The magical light is sufficient for reading, but is not as bright as daylight. The spell may be cast upon an object, in which case the light moves with the object.")
        BulletedText(content: "**Blinding a creature:** By casting the spell upon its eyes. If the target fails a **saving throw versus spells**, it is blinded for the duration. A blind creature cannot attack.")
        BulletedText(content: "**Cancelling darkness:** _Light_ may cancel a _darkness_ spell (see below).")
        Text("Reversed: Darkness")
          .font(.headline)
          .fontWeight(.bold)
        Text("Creates a 15’ radius area of magical blackness, preventing normal sight (but not infravision). Like _light_, it may alternatively be used to blind creatures or to dispel a _light_ spell.")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDLight()
}
