//
//  IndexPublisher.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/20/23.
//

import Foundation

class IndexPublisher: ObservableObject {
/*
Every time selectTabIndex changes, it will notify the
consuming SwiftUI view which in return will update
*/
  @Published var selectTabIndex = 0
}
