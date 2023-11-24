//
//  SDReadMagic.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct SDReadMagic: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // swiftlint:disable line_length
        // Disabled line_length as it causes issues breaking up markdown enhanced text.
        Subtitle(content: "Read Magic")
        Text("**Duration:** 1 turn")
        Text("**Range:** The caster")
          .padding(.bottom, 20)
        Text("By means of _read magic_, the caster can decipher magical inscriptions or runes, as follows:")
        BulletedText(content: "**Scrolls:** The magical script of a scroll of arcane spells can be understood. The caster is then able to activate the scroll at any time in the future.")
        BulletedText(content: "**Spell books:** A spell book written by another arcane spell caster can be deciphered.")
        BulletedText(content: "**Inscriptions:** Runes or magical words inscribed on an object or surface can be understood.")
        BulletedText(content: "**Reading again:** Once the caster has read a magical inscription using _read magic_, they are thereafter able to read that particular writing without recourse to the use of this spell.")
        // swiftlint:enable line_length
      }
      .padding()
      .background(Color.white.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
  }
}

#Preview {
  SDReadMagic()
}
