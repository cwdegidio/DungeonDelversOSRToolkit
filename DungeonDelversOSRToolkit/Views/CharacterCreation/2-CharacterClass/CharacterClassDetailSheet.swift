//
//  CharacterClassDetailSheet.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/17/23.
//

import SwiftUI

struct CharacterClassDetailSheet: View {
  @Environment(\.dismiss)
  var dismiss
  var characterClass: CharacterClass
  @State var characterURLString: AttributedString = ""

  var body: some View {
    VStack {
      ScrollView {
        VStack {
          AbilityTitle(content: characterClass.name)
            .padding(.top)
          Instruction(content: "Scroll to view")
          ForEach(characterClass.classFeatures, id: \.key) { key, value in
            DisclosureGroup {
              Text(MarkdownHelper.returnMarkdown(for: value) ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            } label: {
              BulletedText(content: "**\(key)**")
                .foregroundStyle(Color.primary)
            }
          }
        }
        .padding(.horizontal)
      }
    }
    Text(characterURLString)
    SmallButton(label: "Got it!", icon: "hand.thumbsup.fill", bgColor: Color("tkBlue"), isDisabled: false) {
      dismiss()
    }
    .padding()
    .onAppear {
      characterURLString =
        MarkdownHelper.returnMarkdown(for: "[Learn more in the OSE SRD](\(characterClass.srdURL))") ?? ""
    }
  }
}

#Preview {
  CharacterClassDetailSheet(characterClass: CharacterClass.halfling)
}
