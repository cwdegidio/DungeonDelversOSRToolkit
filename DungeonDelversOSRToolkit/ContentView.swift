//
//  ContentView.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import SwiftUI

struct ContentView: View {
  init() {
    for family in UIFont.familyNames {
      print(family)
      for fontName in UIFont.fontNames(forFamilyName: family) {
        print("-- \(fontName)")
      }
    }
  }

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("18")
        .font(Font.custom("Handlee-Regular", size: 72))
      Text("Hello, world!")
        .font(Font.custom("Courier", size: 36))
        .bold()
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
