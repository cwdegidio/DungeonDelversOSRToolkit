//
//  AlignmentSelector.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/22/23.
//

import SwiftUI

struct AlignmentSelector: View {
  @EnvironmentObject var player: PlayerCharacter
  @State var selectedAlignment: Alignment? = .law

  var body: some View {
    VStack {
      Subtitle(content: "Select Alignment")
        .padding(.bottom, -10)
      Picker("Alignment", selection: $selectedAlignment) {
        ForEach(Alignment.allCases, id: \.rawValue) { alignment in
          Text(alignment.name).tag(alignment as Alignment?)
        }
      }
      .padding(5)
      .pickerStyle(.segmented)
      .background(Color("tkBlue"))
      .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
      .onAppear {
        let fontStyles = [
          NSAttributedString.Key.foregroundColor: UIColor.white,
          NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(fontStyles, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(fontStyles, for: .normal)
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("tkYellow"))
      }
      .onChange(of: $selectedAlignment.wrappedValue) {
        if let newAlignment = selectedAlignment {
          player.alignment = newAlignment
        }
      }
      .padding()
    }
  }
}

#Preview {
  AlignmentSelector()
    .environment(PlayerCharacter())
}
