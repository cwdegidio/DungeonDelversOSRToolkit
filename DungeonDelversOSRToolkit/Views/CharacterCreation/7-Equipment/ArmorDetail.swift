//
//  ArmorDetail.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import SwiftUI

struct ArmorDetail: View {
  @Environment(\.verticalSizeClass)
  var vSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass)
  var hSizeClass: UserInterfaceSizeClass?
  @EnvironmentObject var player: PlayerCharacter
  let viewModel = EquipmentViewModel()
  let armor: Armor
  var purchasable: Bool {
    viewModel.isPurchasable(item: armor, for: player)
  }
  var refundable: Bool {
    viewModel.isPurchasableRefundable(item: armor, for: player)
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
            Image(armor.imgName)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(maxHeight: .infinity)
          }
          .frame(maxWidth: .infinity)
          VStack(alignment: .leading) {
            if refundable {
              SmallButton(
                label: "Refund Cost: \(armor.cost)",
                icon: "dollarsign.arrow.circlepath",
                bgColor: Color("tkBlue"),
                fgColor: Color.white
              ) {
                viewModel.refundCostOfPurchasable(item: armor, for: player)
              }
            } else {
              SmallButton(
                label: purchasable ? "Purchase" : "Not enough gold",
                icon: purchasable ? "dollarsign" : "exclamationmark.octagon.fill",
                bgColor: purchasable ? Color("tkGreen") : Color.gray,
                fgColor: purchasable ? Color.white : Color.black
              ) {
                viewModel.purchaseItem(item: armor, for: player)
              }
              .disabled(!purchasable)
            }
            Text("**Remaining Gold:** \(player.coins[.goldPieces] ?? 0)")
          }
        }
        ScrollView {
          VStack(alignment: .leading) {
            AbilityTitle(content: armor.name)
            Text("**Cost:** \(armor.cost)gp")
              .font(.title2)
            Text("**Armor Class (AC):** \(armor.armorClass)")
            Text(armor.description)
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
  player.coins.updateValue(132, forKey: .goldPieces)
  return ArmorDetail(armor: .leather)
    .environment(player)
}
