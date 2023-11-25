//
//  AmmoDetail.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import SwiftUI

struct AmmoDetail: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = EquipmentViewModel()
  let ammo: Ammo
  var purchasable: Bool {
    viewModel.isPurchasable(item: ammo, for: player)
  }
  var refundable: Bool {
    viewModel.isPurchasableRefundable(item: ammo, for: player)
  }

  var body: some View {
    let portrait = OrientationHelper.isPortrait(hClass: hSizeClass, vClass: vSizeClass)

    let layout = portrait ?
    AnyLayout(VStackLayout()) :
    AnyLayout(HStackLayout())

    ZStack {
      GlobalBackground()
      layout {
        VStack(alignment: .leading) {
          HStack(alignment: .center) {
            Image(ammo.imgName)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(maxHeight: .infinity)
          }
          .frame(maxWidth: .infinity)
          VStack(alignment: .leading) {
            if refundable {
              SmallButton(
                label: "Refund Cost: \(ammo.cost)",
                icon: "dollarsign.arrow.circlepath",
                bgColor: Color("tkBlue"),
                fgColor: Color.white
              ) {
                viewModel.refundCostOfPurchasable(item: ammo, for: player)
              }
            } else {
              SmallButton(
                label: purchasable ? "Purchase" : "Not enough gold",
                icon: purchasable ? "dollarsign" : "exclamationmark.octagon.fill",
                bgColor: purchasable ? Color("tkGreen") : Color.gray,
                fgColor: purchasable ? Color.white : Color.black
              ) {
                viewModel.purchaseItem(item: ammo, for: player)
              }
              .disabled(!purchasable)
            }
            Text("**Remaining Gold:** \(player.coins[.goldPieces] ?? 0)")
          }
        }
        ScrollView {
          VStack(alignment: .leading) {
            AbilityTitle(content: ammo.name)
            Text("**Cost:** \(ammo.cost)gp")
              .font(.title2)
            Text("**Weight:** Ammunition weight is included in the proper missile weapon.")
          }
        }
        Spacer()
      }
      .padding()
    }
  }
}

#Preview {
  let player = PlayerCharacter()
  return AmmoDetail(ammo: .arrows)
    .environment(player)
}
