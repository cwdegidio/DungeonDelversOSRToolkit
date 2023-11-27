//
//  TurningUndeadSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct TurningUndeadSubReview: View {
  let viewModel = TurningUndeadSubReviewModel()

  var body: some View {
    VStack(alignment: .leading) {
      Text("Level 1")
        .frame(maxWidth: .infinity, alignment: .leading)
      HStack {
        let turning = viewModel.getClericTurning()
        ForEach(turning, id: \.key) { key, value in
          MatrixElementStr(upperValue: key, lowerValue: "\(value)")
          Spacer()
        }
      }
      Text("* 2 HD monsters with a special ability")
        .font(.footnote)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(.horizontal, 2)
    .frame(maxWidth: .infinity)
  }
}


#Preview {
  return TurningUndeadSubReview()
}
