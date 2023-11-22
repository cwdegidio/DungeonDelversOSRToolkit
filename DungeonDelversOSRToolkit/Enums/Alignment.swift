//
//  Alignment.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

enum Alignment: String, CaseIterable, Codable {
  case law
  case neutrality
  case chaos

  var name: String {
    switch self {
    case .law:
      return "Law"
    case .neutrality:
      return "Neutrality"
    case .chaos:
      return "Chaos"
    }
  }
}
