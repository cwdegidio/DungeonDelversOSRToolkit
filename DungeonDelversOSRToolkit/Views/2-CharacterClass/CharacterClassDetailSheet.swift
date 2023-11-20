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
  let fallbackURL = "https://oldschoolessentials.necroticgnome.com/srd/index.php/Main_Page"

  var body: some View {
    VStack {
      ScrollView {
        VStack {
          AbilityTitle(content: characterClass.name)
            .padding(.top, 20)
          Instruction(content: "Scroll to view")
          ForEach(characterClass.classFeatures, id: \.key) { key, value in
            DisclosureGroup {
              Text(returnMarkdown(for: value) ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            } label: {
              BulletedText(content: "**\(key)**")
                .foregroundStyle(Color.primary)
            }
          }
        }
        .padding(.horizontal, 20)
      }
    }
    Text(characterURLString)
    SmallButton(label: "Got it!", icon: "hand.thumbsup.fill", bgColor: Color("tkBlue"), fgColor: nil) {
      print("[ DEBUG ] Trying to fire dismiss...")
      dismiss()
    }
    .padding()
    .onAppear {
      characterURLString = returnMarkdown(for: "[Learn more in the OSE SRD](\(characterClass.srdURL))") ?? ""
      print("[ DEBUG ] Character Class in Detail Sheet is: \(characterClass)")
    }
  }

  func returnMarkdown(for value: String) -> AttributedString? {
    do {
      let thisString = try AttributedString(markdown: value)
      return thisString
    } catch {
      print(error)
    }
    return nil
  }
}

#Preview {
  CharacterClassDetailSheet(characterClass: CharacterClass.halfling)
}
