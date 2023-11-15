//
//  ApplicationScreen.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

class ApplicationScreen: ObservableObject, Observable {
  @Published var currentScreen: Screen

  init(currentScreen: Screen) {
    self.currentScreen = currentScreen
  }
}
