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
  var focusedField: FocusState<UUID?>.Binding
  @State var textFieldUUID = UUID()
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
      .focused(focusedField, equals: textFieldUUID)
      .autocorrectionDisabled()
      .onChange(of: enteredText) {
        playerFieldToUpdate = enteredText
      }
    }
    .padding()
  }
}

#Preview {
  let player = PlayerCharacter()
  @FocusState var focusField: UUID?
  return CharacterBioTextField(
    playerFieldToUpdate: .constant(player.name),
    enteredText: .constant(""),
    focusedField: $focusField,
    title: "Name",
    emptyTextContent: "Please enter a name..."
  )
}
