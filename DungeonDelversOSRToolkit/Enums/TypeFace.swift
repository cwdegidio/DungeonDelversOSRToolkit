//
//  TypeFace.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

enum TypeFace {
  case imfell
  case isRegular
  case isBold

  var name: String {
    switch self {
    case .imfell:
      return "IM_FELL_English_Roman"
    case .isRegular:
      return "InriaSerif-Regular"
    case .isBold:
      return "InriaSerif-Bold"
    }
  }
}
