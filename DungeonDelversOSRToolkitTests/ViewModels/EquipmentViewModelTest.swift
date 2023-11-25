//
//  EquipmentViewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/25/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class EquipmentViewModelTest: XCTestCase {
  func test_EquipmentViewModelTest_calculateWeight_shouldBeEqual() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    player.armor = .leather
    player.hasShield = true
    player.weapons = [.sword, .shortBow]
    let weight = viewModel.calculateWeight(for: player)

    XCTAssertEqual(490, weight)
  }

  func test_EquipmentViewModelTest_isPurchasable_withEnoughGold_shouldBeTrue() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    let isPurchasable = viewModel.isPurchasable(item: Armor.plateMail, for: player)

    XCTAssertTrue(isPurchasable)
  }

  func test_EquipmentViewModelTest_isPurchasable_notEnoughGold_shouldBeFalse() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(20, forKey: .goldPieces)
    let isPurchasable = viewModel.isPurchasable(item: Armor.plateMail, for: player)

    XCTAssertFalse(isPurchasable)
  }

  func test_EquipmentViewModelTest_isPurchasableRefundable_withShield_shouldBeTrue() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.hasShield = true
    let isRefundable = viewModel.isPurchasableRefundable(item: Armor.shield, for: player)

    XCTAssertTrue(isRefundable)
  }

  func test_EquipmentViewModelTest_isPurchasableRefundable_withArmor_shouldBeTrue() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.armor = .chainmail
    let isRefundable = viewModel.isPurchasableRefundable(item: Armor.chainmail, for: player)

    XCTAssertTrue(isRefundable)
  }

  func test_EquipmentViewModelTest_isPurchasableRefundable_forWeapon_shouldBeTrue() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.weapons.append(.sword)
    let isRefundable = viewModel.isPurchasableRefundable(item: Weapon.sword, for: player)

    XCTAssertTrue(isRefundable)
  }

  func test_EquipmentViewModelTest_isPurchasableRefundable_forAmmo_shouldBeTrue() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.ammo.append(.arrows)
    let isRefundable = viewModel.isPurchasableRefundable(item: Ammo.arrows, for: player)

    XCTAssertTrue(isRefundable)
  }

  func test_EquipmentViewModelTest_isPurchasableRefundable_forGear_shouldBeTrue() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.gear.append(.backpack)
    let isRefundable = viewModel.isPurchasableRefundable(item: Gear.backpack, for: player)

    XCTAssertTrue(isRefundable)
  }

  func test_EquipmentViewModelTest_isPurchasableRefundable_forNonInventoryShield_shouldBeFasle() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    let isRefundable = viewModel.isPurchasableRefundable(item: Armor.shield, for: player)

    XCTAssertFalse(isRefundable)
  }

  func test_EquipmentViewModelTest_isPurchasableRefundable_forNonInventoryArmor_shouldBeFasle() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    let isRefundable = viewModel.isPurchasableRefundable(item: Armor.chainmail, for: player)

    XCTAssertFalse(isRefundable)
  }

  func test_EquipmentViewModelTest_isPurchasableRefundable_forNonInventoryWeapon_shouldBeFasle() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    let isRefundable = viewModel.isPurchasableRefundable(item: Weapon.sword, for: player)

    XCTAssertFalse(isRefundable)
  }

  func test_EquipmentViewModelTest_isPurchasableRefundable_forNonInventoryAmmo_shouldBeFasle() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    let isRefundable = viewModel.isPurchasableRefundable(item: Ammo.crossbowBolts, for: player)

    XCTAssertFalse(isRefundable)
  }

  func test_EquipmentViewModelTest_isPurchasableRefundable_forNonInventoryGear_shouldBeFasle() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    let isRefundable = viewModel.isPurchasableRefundable(item: Gear.backpack, for: player)

    XCTAssertFalse(isRefundable)
  }

  func test_EquipmentViewModelTest_refundCostOfPurchasable_forShield() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    player.hasShield = true
    viewModel.refundCostOfPurchasable(item: Armor.shield, for: player)
    let currentGold = player.coins[.goldPieces]

    XCTAssertFalse(player.hasShield)
    XCTAssertEqual(110, currentGold)
  }

  func test_EquipmentViewModelTest_refundCostOfPurchasable_forArmor() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    player.armor = .leather
    viewModel.refundCostOfPurchasable(item: Armor.leather, for: player)
    let currentGold = player.coins[.goldPieces]

    XCTAssertNil(player.armor)
    XCTAssertEqual(120, currentGold)
  }

  func test_EquipmentViewModelTest_refundCostOfPurchasable_forWeapon() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    player.weapons.append(.sword)
    viewModel.refundCostOfPurchasable(item: Weapon.sword, for: player)
    let currentGold = player.coins[.goldPieces]

    XCTAssertTrue(player.weapons.isEmpty)
    XCTAssertEqual(110, currentGold)
  }

  func test_EquipmentViewModelTest_refundCostOfPurchasable_forAmmo() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    player.ammo.append(.arrows)
    viewModel.refundCostOfPurchasable(item: Ammo.arrows, for: player)
    let currentGold = player.coins[.goldPieces]

    XCTAssertTrue(player.ammo.isEmpty)
    XCTAssertEqual(105, currentGold)
  }

  func test_EquipmentViewModelTest_refundCostOfPurchasable_forGear() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    player.gear.append(.backpack)
    viewModel.refundCostOfPurchasable(item: Gear.backpack, for: player)
    let currentGold = player.coins[.goldPieces]

    XCTAssertTrue(player.gear.isEmpty)
    XCTAssertEqual(105, currentGold)
  }

  func test_EquipmentViewModelTest_purchaseItem_forShield() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    viewModel.purchaseItem(item: Armor.shield, for: player)
    let currentGold = player.coins[.goldPieces]

    XCTAssertTrue(player.hasShield)
    XCTAssertEqual(90, currentGold)
  }

  func test_EquipmentViewModelTest_purchaseItem_forArmor() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    viewModel.purchaseItem(item: Armor.leather, for: player)
    let currentGold = player.coins[.goldPieces]

    XCTAssertTrue(player.armor == Armor.leather)
    XCTAssertEqual(80, currentGold)
  }

  func test_EquipmentViewModelTest_purchaseItem_forWeapon() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    viewModel.purchaseItem(item: Weapon.sword, for: player)
    let currentGold = player.coins[.goldPieces]

    XCTAssertEqual(1, player.weapons.count)
    XCTAssertTrue(player.weapons.contains { $0 == Weapon.sword })
    XCTAssertEqual(90, currentGold)
  }

  func test_EquipmentViewModelTest_purchaseItem_forAmmo() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    viewModel.purchaseItem(item: Ammo.crossbowBolts, for: player)
    let currentGold = player.coins[.goldPieces]

    XCTAssertEqual(1, player.ammo.count)
    XCTAssertTrue(player.ammo.contains { $0 == Ammo.crossbowBolts })
    XCTAssertEqual(90, currentGold)
  }

  func test_EquipmentViewModelTest_purchaseItem_forGear() throws {
    let viewModel = EquipmentViewModel()
    let player = PlayerCharacter()
    player.coins.updateValue(100, forKey: .goldPieces)
    viewModel.purchaseItem(item: Gear.holySymbol, for: player)
    let currentGold = player.coins[.goldPieces]

    XCTAssertEqual(1, player.gear.count)
    XCTAssertTrue(player.gear.contains { $0 == Gear.holySymbol })
    XCTAssertEqual(75, currentGold)
  }
}
