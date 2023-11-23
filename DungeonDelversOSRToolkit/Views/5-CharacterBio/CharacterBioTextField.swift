//
//  CharacterBioTextField.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/23/23.
//

import SwiftUI

struct CharacterBioTextField: View {
  @Binding var playerFieldToUpdate: String
  @Binding var enteredText: String
  @FocusState var focusState: Bool
  var title: String
  var emptyTextContent: String

  var body: some View {
    VStack(alignment: .leading) {
      Subtitle(content: title)
        .padding(.leading, 5)
        .padding(.bottom, -5)
      TextField(text: $enteredText) {
        Text(emptyTextContent)
      }
      .padding(10)
      .background(.white)
      .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 5)))
      .focused($focusState)
      .onLongPressGesture(minimumDuration: 0.0) {
        focusState = true
      }
      .autocorrectionDisabled()
      .onChange(of: focusState) {
        playerFieldToUpdate = enteredText
      }
    }
    .padding()
  }
}

#Preview {
  var player = PlayerCharacter()
  return CharacterBioTextField(
    playerFieldToUpdate: .constant(player.name),
    enteredText: .constant(""),
    title: "Name",
    emptyTextContent: "Please enter a name..."
  )
}
