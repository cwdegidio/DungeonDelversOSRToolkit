//
//  ReviewItem.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import SwiftUI

struct ReviewItem: View {
  var itemName: String
  var itemValue: String
  var subText: String

  var body: some View {
    VStack(alignment: .leading) {
      ZStack {
        Rectangle()
          .stroke()
          .frame(maxWidth: .infinity)
          .frame(height: 40)
          .background(Color.white)
        HStack {
          Text(itemName)
            .font(.title3)
            .frame(width: 50, height: 30)
            .padding(5)
            .background(Color.black)
            .foregroundStyle(Color.white)
          Spacer()
          Text(itemValue)
          Spacer()
        }
      }
      Text("_\(subText)_")
        .font(.footnote)
    }
    .padding(.bottom, 10)
  }
}

#Preview {
  let stat = CharacterAbility(statType: .int, score: 18)
  return ReviewItem(
    itemName: stat.statType.shortName.uppercased(),
    itemValue: String(stat.score),
    subText: "Languges, Literacy"
  )
}
