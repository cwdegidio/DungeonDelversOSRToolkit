//
//  OrientationHelper.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/20/23.
//

import SwiftUI

enum OrientationHelper {
  static func isPortrait(hClass: UserInterfaceSizeClass?, vClass: UserInterfaceSizeClass?) -> Bool {
    return hClass == .compact && vClass == .regular
  }
}
