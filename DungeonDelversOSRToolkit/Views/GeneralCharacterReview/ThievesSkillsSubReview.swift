//
//  ThievesSkillsSubReview.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/26/23.
//

import SwiftUI

struct ThievesSkillsSubReview: View {
  let viewModel = ThievesSkillsSubReviewModel()

  var body: some View {
    VStack(alignment: .leading) {
      Text("Level 1")
        .frame(maxWidth: .infinity, alignment: .leading)
      HStack {
        let skills = viewModel.getThievesSkills()
        ForEach(skills, id: \.key) { key, value in
          MatrixElementStr(upperValue: key, lowerValue: "\(value)")
          Spacer()
        }
      }
      let defitions = [
        "**CS:** Climb Sheer surfaces",
        "**TR:** Find or remove treasure traps",
        "**HN:** Hear noise",
        "**HS:** Hide in shadows",
        "**MS:** Move silently",
        "**OL:** Open locks",
        "**PP:** Pick pockets"
      ]
      Text(MarkdownHelper.returnMarkdown(for: defitions.joined(separator: ", ")) ?? "")
        .font(.footnote)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(.horizontal, 2)
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  return ThievesSkillsSubReview()
}
