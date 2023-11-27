//
//  ReviewItemModel.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/25/23.
//

import Foundation

struct ReviewItemModel {
  var name: String
  var value: Any
  var subText: String

  init(name: String, valueInt: Int, subText: String) {
    self.name = name
    self.value = valueInt
    self.subText = subText
  }

  init(name: String, valueStr: String, subText: String) {
    self.name = name
    self.value = valueStr
    self.subText = subText
  }
}
