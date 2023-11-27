//
//  MatrixElementStr.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct MatrixElementStr: View {
  let upperValue: String
  let lowerValue: String
  var body: some View {
    ZStack {
      Rectangle()
        .stroke(lineWidth: 2.0)
        .frame(width: 25, height: 60)
      VStack {
        Text(upperValue)
          .foregroundStyle(Color.white)
          .frame(width: 25, height: 30)
          .background(Color.black)
          .padding(.bottom, -9)
        Text(lowerValue)
          .foregroundStyle(Color.black)
          .frame(width: 25, height: 30)
          .background(Color.white)
      }
    }
  }
}

#Preview {
  MatrixElementStr(upperValue: "TD", lowerValue: "\(20)")
}
