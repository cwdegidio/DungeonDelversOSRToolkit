//
//  GlobalBackground.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/15/23.
//

import SwiftUI

struct GlobalBackground: View {
  var body: some View {
    ZStack {
      Rectangle()
        .fill(.black)
        .ignoresSafeArea()
      Image("tkBackground")
        .resizable(resizingMode: .tile)
        .ignoresSafeArea()
    }
  }
}

#Preview {
  GlobalBackground()
}
