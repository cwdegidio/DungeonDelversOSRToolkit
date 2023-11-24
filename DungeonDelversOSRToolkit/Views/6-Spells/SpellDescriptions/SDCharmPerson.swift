//
//  SDCharmPerson.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDCharmPerson: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Charm Person")
        Text("**Duration:** One or more days (see below)")
        Text("**Range:** 120'")
          .padding(.bottom, 20)
        Text("A single human, demihuman, or human-like monster must **save versus spells** or be charmed, as follows:")
        BulletedText(content: "**Friendship:** The subject regards the caster as its trusted friend and ally and will come to the caster’s defence.")
        BulletedText(content: "**Commands:** If they share a language, the caster may give the charmed creature commands, which it will obey.")
        BulletedText(content: "**Subject’s nature:** Commands that contradict the charmed creature’s habits or alignment may be ignored.")
        BulletedText(content: "**Suicidal commands:** An affected creature never obeys suicidal or obviously harmful orders.")
        Text("**Restrictions:** Undead and human-like monsters of greater than 4+1 HD are not affected.")
          .padding()
        Text("**Duration:** The charm lasts indefinitely, but the subject is allowed to make further **saves versus spells** at intervals, depend- ing on its INT score. If one of these saves succeeds, the spell ends.")
        .padding()
        BulletedText(content: "**INT 3–8:** New save once every month.")
        BulletedText(content: "**INT 9–12:** New save once each week.")
        BulletedText(content: "**INT 13–18:** New save once every day.")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}


#Preview {
  SDCharmPerson()
}
