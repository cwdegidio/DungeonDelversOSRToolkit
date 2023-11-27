//
//  MatrixElementInt.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import SwiftUI

struct MatrixElementInt: View {
  let upperValue: Int
  let lowerValue: Int
  var body: some View {
    ZStack {
      Rectangle()
        .stroke(lineWidth: 2.0)
        .frame(width: 25, height: 60)
      VStack {
        Text("\(upperValue)")
          .foregroundStyle(Color.white)
          .frame(width: 25, height: 30)
          .background(Color.black)
          .padding(.bottom, -9)
        Text("\(lowerValue)")
          .foregroundStyle(Color.black)
          .frame(width: 25, height: 30)
          .background(Color.white)
      }
    }
  }
}

#Preview {
  MatrixElementInt(upperValue: 0, lowerValue: 19)
}
