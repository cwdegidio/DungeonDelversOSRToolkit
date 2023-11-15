//
//  Modifier.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

protocol Modifier {
  var modType: Mod { get }
  var asscStat: Stat { get }
}
