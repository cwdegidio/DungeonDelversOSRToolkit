//
//  GearEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

// swiftlint:disable superfluous_disable_command
// This is to fix an error with the file_length lint rule
// swiftlint:disable file_length
// swiftlint:disable type_body_length
// Keep testing logic together
final class GearEnumTest: XCTestCase {
  // Name
  func test_GearEnum_name_backpack_shouldBeEqual() throws {
    XCTAssertEqual("Backpack", Gear.backpack.name)
  }

  func test_GearEnum_name_crowbar_shouldBeEqual() throws {
    XCTAssertEqual("Crowbar", Gear.crowbar.name)
  }

  func test_GearEnum_name_garlic_shouldBeEqual() throws {
    XCTAssertEqual("Garlic", Gear.garlic.name)
  }

  func test_GearEnum_name_grapplingHook_shouldBeEqual() throws {
    XCTAssertEqual("Grappling Hook", Gear.grapplingHook.name)
  }

  func test_GearEnum_name_hammer_shouldBeEqual() throws {
    XCTAssertEqual("Hammer (small)", Gear.hammer.name)
  }

  func test_GearEnum_name_holySymbol_shouldBeEqual() throws {
    XCTAssertEqual("Holy Symbol", Gear.holySymbol.name)
  }

  func test_GearEnum_name_holyWater_shouldBeEqual() throws {
    XCTAssertEqual("Holy water (vial)", Gear.holyWater.name)
  }

  func test_GearEnum_name_ironSpikes_shouldBeEqual() throws {
    XCTAssertEqual("Iron spikes (12)", Gear.ironSpikes.name)
  }

  func test_GearEnum_name_lantern_shouldBeEqual() throws {
    XCTAssertEqual("Lantern", Gear.lantern.name)
  }

  func test_GearEnum_name_mirror_shouldBeEqual() throws {
    XCTAssertEqual("Mirror (hand-sized, steel)", Gear.mirror.name)
  }

  func test_GearEnum_name_oil_shouldBeEqual() throws {
    XCTAssertEqual("Oil (1 flask)", Gear.oil.name)
  }

  func test_GearEnum_name_pole_shouldBeEqual() throws {
    XCTAssertEqual("Pole (10' long, wooden)", Gear.pole.name)
  }

  func test_GearEnum_name_rationsIron_shouldBeEqual() throws {
    XCTAssertEqual("Rations (iron, 7 days)", Gear.rationsIron.name)
  }

  func test_GearEnum_name_rationsStandard_shouldBeEqual() throws {
    XCTAssertEqual("Rations (standard, 7 days)", Gear.rationsStandard.name)
  }

  func test_GearEnum_name_rope_shouldBeEqual() throws {
    XCTAssertEqual("Rope (50')", Gear.rope.name)
  }

  func test_GearEnum_name_sackLarge_shouldBeEqual() throws {
    XCTAssertEqual("Sack (large)", Gear.sackLarge.name)
  }

  func test_GearEnum_name_sackSmall_shouldBeEqual() throws {
    XCTAssertEqual("Sack (small)", Gear.sackSmall.name)
  }

  func test_GearEnum_name_stakesAndMallet_shouldBeEqual() throws {
    XCTAssertEqual("Stakes (3) and mallet", Gear.stakesAndMallet.name)
  }

  func test_GearEnum_name_thievesTools_shouldBeEqual() throws {
    XCTAssertEqual("Thieves' tools", Gear.thievesTools.name)
  }

  func test_GearEnum_name_tinderBox_shouldBeEqual() throws {
    XCTAssertEqual("Tinder box (flint & steel)", Gear.tinderBox.name)
  }

  func test_GearEnum_name_torches_shouldBeEqual() throws {
    XCTAssertEqual("Torches (6)", Gear.torches.name)
  }

  func test_GearEnum_name_waterskin_shouldBeEqual() throws {
    XCTAssertEqual("Waterskin", Gear.waterskin.name)
  }

  func test_GearEnum_name_wine_shouldBeEqual() throws {
    XCTAssertEqual("Wine (2 pints)", Gear.wine.name)
  }

  func test_GearEnum_name_wolfsbane_shouldBeEqual() throws {
    XCTAssertEqual("Wolfsbane (1 bunch)", Gear.wolfsbane.name)
  }

  // cost
  func test_GearEnum_cost_backpack_shouldBeEqual() throws {
    XCTAssertEqual(5, Gear.backpack.cost)
  }

  func test_GearEnum_cost_crowbar_shouldBeEqual() throws {
    XCTAssertEqual(10, Gear.crowbar.cost)
  }

  func test_GearEnum_cost_garlic_shouldBeEqual() throws {
    XCTAssertEqual(5, Gear.garlic.cost)
  }

  func test_GearEnum_cost_grapplingHook_shouldBeEqual() throws {
    XCTAssertEqual(25, Gear.grapplingHook.cost)
  }

  func test_GearEnum_cost_hammer_shouldBeEqual() throws {
    XCTAssertEqual(2, Gear.hammer.cost)
  }

  func test_GearEnum_cost_holySymbol_shouldBeEqual() throws {
    XCTAssertEqual(25, Gear.holySymbol.cost)
  }

  func test_GearEnum_cost_holyWater_shouldBeEqual() throws {
    XCTAssertEqual(25, Gear.holyWater.cost)
  }

  func test_GearEnum_cost_ironSpikes_shouldBeEqual() throws {
    XCTAssertEqual(1, Gear.ironSpikes.cost)
  }

  func test_GearEnum_cost_lantern_shouldBeEqual() throws {
    XCTAssertEqual(10, Gear.lantern.cost)
  }

  func test_GearEnum_cost_mirror_shouldBeEqual() throws {
    XCTAssertEqual(5, Gear.mirror.cost)
  }

  func test_GearEnum_cost_oil_shouldBeEqual() throws {
    XCTAssertEqual(2, Gear.oil.cost)
  }

  func test_GearEnum_cost_pole_shouldBeEqual() throws {
    XCTAssertEqual(1, Gear.pole.cost)
  }

  func test_GearEnum_cost_rationsIron_shouldBeEqual() throws {
    XCTAssertEqual(15, Gear.rationsIron.cost)
  }

  func test_GearEnum_cost_rationsStandard_shouldBeEqual() throws {
    XCTAssertEqual(5, Gear.rationsStandard.cost)
  }

  func test_GearEnum_cost_rope_shouldBeEqual() throws {
    XCTAssertEqual(1, Gear.rope.cost)
  }

  func test_GearEnum_cost_sackLarge_shouldBeEqual() throws {
    XCTAssertEqual(2, Gear.sackLarge.cost)
  }

  func test_GearEnum_cost_sackSmall_shouldBeEqual() throws {
    XCTAssertEqual(1, Gear.sackSmall.cost)
  }

  func test_GearEnum_cost_stakesAndMallet_shouldBeEqual() throws {
    XCTAssertEqual(3, Gear.stakesAndMallet.cost)
  }

  func test_GearEnum_cost_thievesTools_shouldBeEqual() throws {
    XCTAssertEqual(25, Gear.thievesTools.cost)
  }

  func test_GearEnum_cost_tinderBox_shouldBeEqual() throws {
    XCTAssertEqual(3, Gear.tinderBox.cost)
  }

  func test_GearEnum_cost_torches_shouldBeEqual() throws {
    XCTAssertEqual(1, Gear.torches.cost)
  }

  func test_GearEnum_cost_waterskin_shouldBeEqual() throws {
    XCTAssertEqual(1, Gear.waterskin.cost)
  }

  func test_GearEnum_cost_wine_shouldBeEqual() throws {
    XCTAssertEqual(1, Gear.wine.cost)
  }

  func test_GearEnum_cost_wolfsbane_shouldBeEqual() throws {
    XCTAssertEqual(10, Gear.wolfsbane.cost)
  }

  // description
  func test_GearEnum_description_backpack_shouldBeEqual() throws {
    let desc = "Has two straps and can be worn on the back, keeping the hands free. Holds up to 400 coins."
    XCTAssertEqual(desc, Gear.backpack.description)
  }

  func test_GearEnum_description_crowbar_shouldBeEqual() throws {
    let desc = "2–3' long and made of solid iron. Can be used for forcing doors and other objects open."
    XCTAssertEqual(desc, Gear.crowbar.description)
  }

  func test_GearEnum_description_garlic_shouldBeEqual() throws {
    let desc = "A single head of fresh garlic. Helpful for warding off certain undead."
    XCTAssertEqual(desc, Gear.garlic.description)
  }

  func test_GearEnum_description_grapplingHook_shouldBeEqual() throws {
    let desc = "Has 3 or 4 prongs. Can be used for anchoring a rope."
    XCTAssertEqual(desc, Gear.grapplingHook.description)
  }

  func test_GearEnum_description_hammer_shouldBeEqual() throws {
    let desc = "Can be used for construction or as a mallet with iron or wooden spikes."
    XCTAssertEqual(desc, Gear.hammer.description)
  }

  func test_GearEnum_description_holySymbol_shouldBeEqual() throws {
    let desc = "A divine spell caster is required to own a holy symbol of their deity, " +
    "often worn as a necklace. Each religion has its own holy symbol."
    XCTAssertEqual(desc, Gear.holySymbol.description)
  }

  func test_GearEnum_description_holyWater_shouldBeEqual() throws {
    let desc = "Water that has been blessed by a holy person. " +
    "It is used in some religious rituals and inflicts damage on undead monsters. " +
    "Holy water does not retain its power if stored in any other container than the special vials it is blessed in."
    XCTAssertEqual(desc, Gear.holyWater.description)
  }

  func test_GearEnum_description_ironSpikes_shouldBeEqual() throws {
    let desc = "May be used for wedging doors open or shut, as an anchor to attach a rope to, and many other purposes."
    XCTAssertEqual(desc, Gear.ironSpikes.description)
  }

  func test_GearEnum_description_lantern_shouldBeEqual() throws {
    let desc = "Can be closed to hide the light. " +
    "Burns one oil flask every four hours (24 turns). Casts light in a 30' radius."
    XCTAssertEqual(desc, Gear.lantern.description)
  }

  func test_GearEnum_description_mirror_shouldBeEqual() throws {
    let desc = "Useful for looking around corners or for reflecting a gaze attack."
    XCTAssertEqual(desc, Gear.mirror.description)
  }

  func test_GearEnum_description_oil_shouldBeEqual() throws {
    let desc = "A flask of oil fuels a lantern for four hours (24 turns). " +
    "In addition to fuelling lanterns, oil can be used as a weapon."
    XCTAssertEqual(desc, Gear.oil.description)
  }

  func test_GearEnum_description_pole_shouldBeEqual() throws {
    let desc = "A 2” thick wooden pole useful for poking and prodding suspicious items in a dungeon."
    XCTAssertEqual(desc, Gear.pole.description)
  }

  func test_GearEnum_description_rationsIron_shouldBeEqual() throws {
    let desc = "Dried and preserved food to be carried on long voyages when securing fresh food may be uncertain."
    XCTAssertEqual(desc, Gear.rationsIron.description)
  }

  func test_GearEnum_description_rationsStandard_shouldBeEqual() throws {
    let desc = "Fresh, unpreserved food."
    XCTAssertEqual(desc, Gear.rationsStandard.description)
  }

  func test_GearEnum_description_rope_shouldBeEqual() throws {
    let desc = "Can hold the weight of approximately three human-sized beings."
    XCTAssertEqual(desc, Gear.rope.description)
  }

  func test_GearEnum_description_sackLarge_shouldBeEqual() throws {
    let desc = "Can hold up to 600 coins."
    XCTAssertEqual(desc, Gear.sackLarge.description)
  }

  func test_GearEnum_description_sackSmall_shouldBeEqual() throws {
    let desc = "Can hold up to 200 coins."
    XCTAssertEqual(desc, Gear.sackSmall.description)
  }

  func test_GearEnum_description_stakesAndMallet_shouldBeEqual() throws {
    let desc = "A wooden mallet and three 18\" long stakes. Valuable when confronting vampires."
    XCTAssertEqual(desc, Gear.stakesAndMallet.description)
  }

  func test_GearEnum_description_thievesTools_shouldBeEqual() throws {
    let desc = "This kit contains all of the tools needed to pick locks."
    XCTAssertEqual(desc, Gear.thievesTools.description)
  }

  func test_GearEnum_description_tinderBox_shouldBeEqual() throws {
    let desc = "Used to light fires, including torches. Using a tinder box takes one round. " +
    "There is a 2-in-6 chance of success per round."
    XCTAssertEqual(desc, Gear.tinderBox.description)
  }

  func test_GearEnum_description_torches_shouldBeEqual() throws {
    let desc = "A torch burns for 1 hour (6 turns), clearly illuminating a 30' radius. " +
    "Torches may also be used in combat."
    XCTAssertEqual(desc, Gear.torches.description)
  }

  func test_GearEnum_description_waterskin_shouldBeEqual() throws {
    let desc = "This container, made of hide, will hold 2 pints (1 quart) of fluid."
    XCTAssertEqual(desc, Gear.waterskin.description)
  }

  func test_GearEnum_description_wine_shouldBeEqual() throws {
    let desc = "A simple wine of average quality."
    XCTAssertEqual(desc, Gear.wine.description)
  }

  func test_GearEnum_description_wolfsbane_shouldBeEqual() throws {
    let desc = "This herb can be used to repel lycanthropes. The creature must be hit with the herb in melee combat."
    XCTAssertEqual(desc, Gear.wolfsbane.description)
  }

  // image name
  func test_GearEnum_imgName_backpack_shouldBeEqual() throws {
    XCTAssertEqual("gBackpack", Gear.backpack.imgName)
  }

  func test_GearEnum_imgName_crowbar_shouldBeEqual() throws {
    XCTAssertEqual("gCrowbar", Gear.crowbar.imgName)
  }

  func test_GearEnum_imgName_garlic_shouldBeEqual() throws {
    XCTAssertEqual("gGarlic", Gear.garlic.imgName)
  }

  func test_GearEnum_imgName_grapplingHook_shouldBeEqual() throws {
    XCTAssertEqual("gGrapplinghook", Gear.grapplingHook.imgName)
  }

  func test_GearEnum_imgName_hammer_shouldBeEqual() throws {
    XCTAssertEqual("gHammer", Gear.hammer.imgName)
  }

  func test_GearEnum_imgName_holySymbol_shouldBeEqual() throws {
    XCTAssertEqual("gHolySymbol", Gear.holySymbol.imgName)
  }

  func test_GearEnum_imgName_holyWater_shouldBeEqual() throws {
    XCTAssertEqual("gHolyWater", Gear.holyWater.imgName)
  }

  func test_GearEnum_imgName_ironSpikes_shouldBeEqual() throws {
    XCTAssertEqual("gIronSpikes", Gear.ironSpikes.imgName)
  }

  func test_GearEnum_imgName_lantern_shouldBeEqual() throws {
    XCTAssertEqual("gLantern", Gear.lantern.imgName)
  }

  func test_GearEnum_imgName_mirror_shouldBeEqual() throws {
    XCTAssertEqual("gMirror", Gear.mirror.imgName)
  }

  func test_GearEnum_imgName_oil_shouldBeEqual() throws {
    XCTAssertEqual("gOil", Gear.oil.imgName)
  }

  func test_GearEnum_imgName_pole_shouldBeEqual() throws {
    XCTAssertEqual("gPole", Gear.pole.imgName)
  }

  func test_GearEnum_imgName_rationsIron_shouldBeEqual() throws {
    XCTAssertEqual("gRationsIron", Gear.rationsIron.imgName)
  }

  func test_GearEnum_imgName_rationsStandard_shouldBeEqual() throws {
    XCTAssertEqual("gRationsStandard", Gear.rationsStandard.imgName)
  }

  func test_GearEnum_imgName_rope_shouldBeEqual() throws {
    XCTAssertEqual("gRope", Gear.rope.imgName)
  }

  func test_GearEnum_imgName_sackLarge_shouldBeEqual() throws {
    XCTAssertEqual("gSackLarge", Gear.sackLarge.imgName)
  }

  func test_GearEnum_imgName_sackSmall_shouldBeEqual() throws {
    XCTAssertEqual("gSackSmall", Gear.sackSmall.imgName)
  }

  func test_GearEnum_imgName_stakesAndMallet_shouldBeEqual() throws {
    XCTAssertEqual("gStakeAndMallet", Gear.stakesAndMallet.imgName)
  }

  func test_GearEnum_imgName_thievesTools_shouldBeEqual() throws {
    XCTAssertEqual("gThievesTools", Gear.thievesTools.imgName)
  }

  func test_GearEnum_imgName_tinderBox_shouldBeEqual() throws {
    XCTAssertEqual("gTinderBox", Gear.tinderBox.imgName)
  }

  func test_GearEnum_imgName_torches_shouldBeEqual() throws {
    XCTAssertEqual("gTorch", Gear.torches.imgName)
  }

  func test_GearEnum_imgName_waterskin_shouldBeEqual() throws {
    XCTAssertEqual("gWaterskin", Gear.waterskin.imgName)
  }

  func test_GearEnum_imgName_wine_shouldBeEqual() throws {
    XCTAssertEqual("gWine", Gear.wine.imgName)
  }

  func test_GearEnum_imgName_wolfsbane_shouldBeEqual() throws {
    XCTAssertEqual("gWolfsbane", Gear.wolfsbane.imgName)
  }
}

// swiftlint:enable type_body_length
// swiftlint:enable superfluous_disable_command
// swiftlint:enable file_length
