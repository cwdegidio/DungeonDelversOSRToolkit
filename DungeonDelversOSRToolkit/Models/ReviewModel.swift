//
//  ReviewModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/27/23.
//

import Foundation

class ReviewModel: ObservableObject {
  @Published var currentCharacter: PlayerCharacter?

  init() {
    self.currentCharacter = nil
  }
}
