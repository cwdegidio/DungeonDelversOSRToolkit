//
//  Equipment.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct Equipment: View {
  var body: some View {
    @Environment(\.verticalSizeClass)
    var vSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass)
    var hSizeClass: UserInterfaceSizeClass?
    @EnvironmentObject var player: PlayerCharacter
    @EnvironmentObject var screen: ApplicationScreen

    ZStack {
      GlobalBackground()
      VStack {
        TabView {
          Group {
            ArmorView()
              .background(BackgroundHelper())
              .tabItem {
                Label("Armor", systemImage: "shield")
              }
            Weapons()
              .background(BackgroundHelper())
              .tabItem {
                Label("Weapons", systemImage: "figure.fencing")
              }
            Ammo()
              .background(BackgroundHelper())
              .tabItem {
                Label("Ammo", systemImage: "figure.archery")
              }
            Gear()
              .background(BackgroundHelper())
              .tabItem {
                Label("Gear", systemImage: "hammer.fill")
              }
            Inventory()
              .background(BackgroundHelper())
              .tabItem {
                Label("Inventory", systemImage: "backpack.fill")
              }
          }
        }
        LargeButton(label: "Next Step: Save Character") {
          print("testing")
        }
        .padding()
      }
    }
  }
}

struct BackgroundHelper: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let view = UIView()
    DispatchQueue.main.async {
      // find first superview with color and make it transparent
      var parent = view.superview
      repeat {
        if parent?.backgroundColor != nil {
          parent?.backgroundColor = UIColor.clear
          break
        }
        parent = parent?.superview
      } while (parent != nil)
    }
    return view
  }

  func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
  let player = PlayerCharacter()
  return Equipment()
    .environment(player)
}
