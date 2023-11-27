//
//  MovementSubReviewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/27/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class MovementSubReviewModelTest: XCTestCase {
  // Overland
  func test_MovementSubReviewModel_getMovement_Unencumbered_Overland_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(400, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .overland, using: player)

    XCTAssertEqual("Ov", data.name)
    XCTAssertEqual("24", String(describing: data.value))
    XCTAssertEqual("Overland: 1/5 base mv. rate (miles/day)", data.subText)
  }

  func test_MovementSubReviewModel_getMovement_Unencumbered_Overland_600_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(600, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .overland, using: player)

    XCTAssertEqual("Ov", data.name)
    XCTAssertEqual("18", String(describing: data.value))
    XCTAssertEqual("Overland: 1/5 base mv. rate (miles/day)", data.subText)
  }

  func test_MovementSubReviewModel_getMovement_Unencumbered_Overland_800_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(800, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .overland, using: player)

    XCTAssertEqual("Ov", data.name)
    XCTAssertEqual("12", String(describing: data.value))
    XCTAssertEqual("Overland: 1/5 base mv. rate (miles/day)", data.subText)
  }

  func test_MovementSubReviewModel_getMovement_Unencumbered_Overland_900_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(900, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .overland, using: player)

    XCTAssertEqual("Ov", data.name)
    XCTAssertEqual("6", String(describing: data.value))
    XCTAssertEqual("Overland: 1/5 base mv. rate (miles/day)", data.subText)
  }

  // Exploration
  func test_MovementSubReviewModel_getMovement_Unencumbered_Exploration_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(400, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .exploration, using: player)

    XCTAssertEqual("Ex", data.name)
    XCTAssertEqual("120", String(describing: data.value))
    XCTAssertEqual("Exploration: base mv. rate (feet/turn)", data.subText)
  }

  func test_MovementSubReviewModel_getMovement_Unencumbered_Exploration_600_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(600, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .exploration, using: player)

    XCTAssertEqual("Ex", data.name)
    XCTAssertEqual("90", String(describing: data.value))
    XCTAssertEqual("Exploration: base mv. rate (feet/turn)", data.subText)
  }

  func test_MovementSubReviewModel_getMovement_Unencumbered_Exploration_800_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(800, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .exploration, using: player)

    XCTAssertEqual("Ex", data.name)
    XCTAssertEqual("60", String(describing: data.value))
    XCTAssertEqual("Exploration: base mv. rate (feet/turn)", data.subText)
  }

  func test_MovementSubReviewModel_getMovement_Unencumbered_Exploration_900_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(900, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .exploration, using: player)

    XCTAssertEqual("Ex", data.name)
    XCTAssertEqual("30", String(describing: data.value))
    XCTAssertEqual("Exploration: base mv. rate (feet/turn)", data.subText)
  }

  // Exploration
  func test_MovementSubReviewModel_getMovement_Unencumbered_Encounter_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(400, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .encounter, using: player)

    XCTAssertEqual("En", data.name)
    XCTAssertEqual("40", String(describing: data.value))
    XCTAssertEqual("Encounter: 1/3 base mv. rate (feet/round)", data.subText)
  }

  func test_MovementSubReviewModel_getMovement_Unencumbered_Encounter_600_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(600, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .encounter, using: player)

    XCTAssertEqual("En", data.name)
    XCTAssertEqual("30", String(describing: data.value))
    XCTAssertEqual("Encounter: 1/3 base mv. rate (feet/round)", data.subText)
  }

  func test_MovementSubReviewModel_getMovement_Unencumbered_Encounter_800_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(800, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .encounter, using: player)

    XCTAssertEqual("En", data.name)
    XCTAssertEqual("20", String(describing: data.value))
    XCTAssertEqual("Encounter: 1/3 base mv. rate (feet/round)", data.subText)
  }

  func test_MovementSubReviewModel_getMovement_Unencumbered_Encounter_900_shouldBeEqual() throws {
    let viewModel = MovementSubReviewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(900, forKey: .goldPieces)
    let data = viewModel.getMovement(for: .encounter, using: player)

    XCTAssertEqual("En", data.name)
    XCTAssertEqual("10", String(describing: data.value))
    XCTAssertEqual("Encounter: 1/3 base mv. rate (feet/round)", data.subText)
  }
}
