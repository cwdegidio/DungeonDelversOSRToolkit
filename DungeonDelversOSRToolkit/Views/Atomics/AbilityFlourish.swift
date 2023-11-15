//
//  AbilityFlourish.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct AbilityFlourish: View {
  var body: some View {
    ZStack {
      Circle()
        .foregroundStyle(Color(red: 0.58, green: 0.67, blue: 0.40))
        .frame(width: 100)
        .offset(x: -150)
      Circle()
        .foregroundStyle(Color(red: 0.58, green: 0.67, blue: 0.40))
        .frame(width: 100)
        .offset(x: 150)
      Circle()
        .foregroundStyle(Color(red: 0.68, green: 0.18, blue: 0.21))
        .frame(width: 150)
        .offset(x: -75)
      Circle()
        .foregroundStyle(Color(red: 0.68, green: 0.18, blue: 0.21))
        .frame(width: 150)
        .offset(x: 75)
      CircularStar()
        .foregroundStyle(Color(red: 0.80, green: 0.59, blue: 0.18))
        .frame(width: 200, height: 200)
        .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 50)
      CircularStar()
        .stroke(Color(white: 0.8))
        .frame(width: 200, height: 200)
    }
    .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.4), radius: 20)
  }
}

#Preview {
  AbilityFlourish()
}
