//
//  Hexagon.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/18/23.
//

import SwiftUI

struct Hexagon: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height
    path.move(to: CGPoint(x: 0.5 * width, y: 0))
    path.addLine(to: CGPoint(x: 0.99772 * width, y: 0.25 * height))
    path.addLine(to: CGPoint(x: 0.99772 * width, y: 0.75 * height))
    path.addLine(to: CGPoint(x: 0.5 * width, y: height))
    path.addLine(to: CGPoint(x: 0.00228 * width, y: 0.75 * height))
    path.addLine(to: CGPoint(x: 0.00228 * width, y: 0.25 * height))
    path.addLine(to: CGPoint(x: 0.5 * width, y: 0))
    path.closeSubpath()
    return path
  }
}
