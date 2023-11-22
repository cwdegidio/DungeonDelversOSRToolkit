//
//  Ability.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

protocol Ability: Codable {
  var statType: Stat { get }
  var score: Int { get set }
}
