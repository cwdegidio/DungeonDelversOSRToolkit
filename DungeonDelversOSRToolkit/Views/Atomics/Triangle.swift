//
//  Triangle.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/18/23.
//

import SwiftUI

struct Triangle: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height
    path.move(to: CGPoint(x: 0, y: 0.5 * height))
    path.addLine(to: CGPoint(x: width, y: 0.00228 * height))
    path.addLine(to: CGPoint(x: width, y: 0.99772 * height))
    path.addLine(to: CGPoint(x: 0, y: 0.5 * height))
    path.closeSubpath()
    return path
  }
}
