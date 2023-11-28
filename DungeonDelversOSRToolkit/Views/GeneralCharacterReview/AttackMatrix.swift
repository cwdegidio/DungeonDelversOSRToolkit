//
//  AttackMatrix.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import SwiftUI

struct AttackMatrix: View {
  let level1THAC0 = 19
  var body: some View {
    VStack(alignment: .leading) {
      Text("**THAC0:** 19")
      HStack {
        ForEach((0...9).reversed(), id: \.self) { armorClass in
          MatrixElementInt(upperValue: armorClass, lowerValue: level1THAC0 - armorClass)
          if armorClass != 0 {
            Spacer()
          }
        }
      }
    }
    .padding(.horizontal, 2)
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  AttackMatrix()
}
