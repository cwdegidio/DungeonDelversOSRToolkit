//
//  AbilityStatBlock.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct AbilityStatBlock: View {
  let score: Int
  let ability: String

  var body: some View {
    ZStack {
      RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
        .stroke(.black, lineWidth: 5)
        .fill(Color("tkGreen"))
        .frame(width: 75, height: 75)
        .shadow(color: .black.opacity(0.8), radius: 2.5)
      VStack {
        Text("\(score)")
          .font(Font.custom("Courier", size: 26))
          .font(.title)
        Text("\(ability)")
          .font(Font.custom("Courier", size: 21))
          .fontWeight(.black)
      }
    }
  }
}

#Preview {
  AbilityStatBlock(score: 18, ability: "Str")
}
