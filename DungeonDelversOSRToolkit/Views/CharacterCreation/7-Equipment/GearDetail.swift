//
//  GearDetail.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import SwiftUI

struct GearDetail: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = EquipmentViewModel()
  let gear: Gear
  var purchasable: Bool {
    viewModel.isPurchasable(item: gear, for: player)
  }
  var refundable: Bool {
    viewModel.isPurchasableRefundable(item: gear, for: player)
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
            Image(gear.imgName)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(maxHeight: .infinity)
          }
          .frame(maxWidth: .infinity)
          VStack(alignment: .leading) {
            if refundable {
              SmallButton(
                label: "Refund Cost: \(gear.cost)",
                icon: "dollarsign.arrow.circlepath",
                bgColor: Color("tkBlue"),
                fgColor: Color.white
              ) {
                viewModel.refundCostOfPurchasable(item: gear, for: player)
              }
            } else {
              SmallButton(
                label: purchasable ? "Purchase" : "Not enough gold",
                icon: purchasable ? "dollarsign" : "exclamationmark.octagon.fill",
                bgColor: purchasable ? Color("tkGreen") : Color.gray,
                fgColor: purchasable ? Color.white : Color.black
              ) {
                viewModel.purchaseItem(item: gear, for: player)
              }
              .disabled(!purchasable)
            }
            Text("**Remaining Gold:** \(player.coins[.goldPieces] ?? 0)")
          }
        }
        ScrollView {
          VStack(alignment: .leading) {
            AbilityTitle(content: gear.name)
            Text("**Cost:** \(gear.cost)gp")
              .font(.title2)
            Text("\(gear.description)")
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
  return GearDetail(gear: .backpack)
    .environment(player)
}
