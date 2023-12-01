//
//  WeaponDetail.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import SwiftUI

struct WeaponDetail: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = EquipmentViewModel()
  let weapon: Weapon
  @State var qualityStringList: [String] = []
  var purchasable: Bool {
    viewModel.isPurchasable(item: weapon, for: player)
  }
  var refundable: Bool {
    viewModel.isPurchasableRefundable(item: weapon, for: player)
  }

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

    let layout = portrait ?
    AnyLayout(VStackLayout()) :
    AnyLayout(HStackLayout())

    ZStack {
      GlobalBackground()
      layout {
        VStack {
          HStack(alignment: .center) {
            Image(weapon.imgName)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(maxHeight: .infinity)
          }
          .frame(maxWidth: .infinity)
          VStack {
            if refundable {
              SmallButton(
                label: "Refund Cost: \(weapon.cost)",
                icon: "dollarsign.arrow.circlepath",
                bgColor: Color("tkBlue"),
                isDisabled: false
              ) {
                viewModel.refundCostOfPurchasable(item: weapon, for: player)
              }
            } else {
              SmallButton(
                label: purchasable ? "Purchase" : "Not enough gold",
                icon: purchasable ? "dollarsign" : "exclamationmark.octagon.fill",
                bgColor: Color("tkGreen"),
                isDisabled: false
              ) {
                viewModel.purchaseItem(item: weapon, for: player)
              }
              .disabled(!purchasable)
            }
            Text("**Remaining Gold:** \(player.coins[.goldPieces] ?? 0)")
          }
        }
        ScrollView {
          VStack(alignment: .leading) {
            AbilityTitle(content: weapon.name)
            Text("**Cost:** \(weapon.cost)gp")
              .font(.title2)
            Text("**Damage:** 1\(weapon.damage.description)")
            Text("**Qualities:** \(qualityStringList.joined(separator: ", "))")
          }
        }
        Spacer()
      }
      .padding()
    }
    .onAppear {
      for quality in weapon.qualities {
        var text = ""
        if quality == .missile {
          text = "\(quality.name) \(weapon.range)"
        } else {
          text = quality.name
        }
        qualityStringList.append(text)
      }
    }
  }
}


#Preview {
  let player = PlayerCharacter()
  player.coins.updateValue(132, forKey: .goldPieces)
  return WeaponDetail(weapon: .crossbow)
    .environment(player)
}
