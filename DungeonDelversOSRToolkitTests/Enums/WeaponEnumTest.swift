//
//  WeaponEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 12/1/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit
// swiftlint:disable type_body_length
// swiftlint:disable file_length
// Keep testing logic together
final class WeaponEnumTest: XCTestCase {
  // Name
  func test_WeaponEnum_name_battleAxe_shouldBeEqual() throws {
    XCTAssertEqual("Battle axe", Weapon.battleAxe.name)
  }

  func test_WeaponEnum_name_club_shouldBeEqual() throws {
    XCTAssertEqual("Club", Weapon.club.name)
  }

  func test_WeaponEnum_name_crossbow_shouldBeEqual() throws {
    XCTAssertEqual("Crossbow", Weapon.crossbow.name)
  }

  func test_WeaponEnum_name_dagger_shouldBeEqual() throws {
    XCTAssertEqual("Dagger", Weapon.dagger.name)
  }

  func test_WeaponEnum_name_handAxe_shouldBeEqual() throws {
    XCTAssertEqual("Hand axe", Weapon.handAxe.name)
  }

  func test_WeaponEnum_name_javelin_shouldBeEqual() throws {
    XCTAssertEqual("Javelin", Weapon.javelin.name)
  }

  func test_WeaponEnum_name_lance_shouldBeEqual() throws {
    XCTAssertEqual("Lance", Weapon.lance.name)
  }

  func test_WeaponEnum_name_longBow_shouldBeEqual() throws {
    XCTAssertEqual("Long bow", Weapon.longBow.name)
  }

  func test_WeaponEnum_name_mace_shouldBeEqual() throws {
    XCTAssertEqual("Mace", Weapon.mace.name)
  }

  func test_WeaponEnum_name_poleArm_shouldBeEqual() throws {
    XCTAssertEqual("Pole arm", Weapon.poleArm.name)
  }

  func test_WeaponEnum_name_shortBow_shouldBeEqual() throws {
    XCTAssertEqual("Short bow", Weapon.shortBow.name)
  }

  func test_WeaponEnum_name_shortSword_shouldBeEqual() throws {
    XCTAssertEqual("Short sword", Weapon.shortSword.name)
  }

  func test_WeaponEnum_name_silverDagger_shouldBeEqual() throws {
    XCTAssertEqual("Silver dagger", Weapon.silverDagger.name)
  }

  func test_WeaponEnum_name_sling_shouldBeEqual() throws {
    XCTAssertEqual("Sling", Weapon.sling.name)
  }

  func test_WeaponEnum_name_spear_shouldBeEqual() throws {
    XCTAssertEqual("Spear", Weapon.spear.name)
  }

  func test_WeaponEnum_name_staff_shouldBeEqual() throws {
    XCTAssertEqual("Staff", Weapon.staff.name)
  }

  func test_WeaponEnum_name_sword_shouldBeEqual() throws {
    XCTAssertEqual("Sword", Weapon.sword.name)
  }

  func test_WeaponEnum_name_twoHandedSword_shouldBeEqual() throws {
    XCTAssertEqual("Two-handed sword", Weapon.twoHandedSword.name)
  }

  func test_WeaponEnum_name_warHammer_shouldBeEqual() throws {
    XCTAssertEqual("War hammer", Weapon.warHammer.name)
  }

  // Cost
  func test_WeaponEnum_cost_battleAxe_shouldBeEqual() throws {
    XCTAssertEqual(7, Weapon.battleAxe.cost)
  }

  func test_WeaponEnum_cost_club_shouldBeEqual() throws {
    XCTAssertEqual(3, Weapon.club.cost)
  }

  func test_WeaponEnum_cost_crossbow_shouldBeEqual() throws {
    XCTAssertEqual(30, Weapon.crossbow.cost)
  }

  func test_WeaponEnum_cost_dagger_shouldBeEqual() throws {
    XCTAssertEqual(3, Weapon.dagger.cost)
  }

  func test_WeaponEnum_cost_handAxe_shouldBeEqual() throws {
    XCTAssertEqual(4, Weapon.handAxe.cost)
  }

  func test_WeaponEnum_cost_javelin_shouldBeEqual() throws {
    XCTAssertEqual(1, Weapon.javelin.cost)
  }

  func test_WeaponEnum_cost_lance_shouldBeEqual() throws {
    XCTAssertEqual(5, Weapon.lance.cost)
  }

  func test_WeaponEnum_cost_longBow_shouldBeEqual() throws {
    XCTAssertEqual(40, Weapon.longBow.cost)
  }

  func test_WeaponEnum_cost_mace_shouldBeEqual() throws {
    XCTAssertEqual(5, Weapon.mace.cost)
  }

  func test_WeaponEnum_cost_poleArm_shouldBeEqual() throws {
    XCTAssertEqual(7, Weapon.poleArm.cost)
  }

  func test_WeaponEnum_cost_shortBow_shouldBeEqual() throws {
    XCTAssertEqual(25, Weapon.shortBow.cost)
  }

  func test_WeaponEnum_cost_shortSword_shouldBeEqual() throws {
    XCTAssertEqual(7, Weapon.shortSword.cost)
  }

  func test_WeaponEnum_cost_silverDagger_shouldBeEqual() throws {
    XCTAssertEqual(30, Weapon.silverDagger.cost)
  }

  func test_WeaponEnum_cost_sling_shouldBeEqual() throws {
    XCTAssertEqual(2, Weapon.sling.cost)
  }

  func test_WeaponEnum_cost_spear_shouldBeEqual() throws {
    XCTAssertEqual(3, Weapon.spear.cost)
  }

  func test_WeaponEnum_cost_staff_shouldBeEqual() throws {
    XCTAssertEqual(2, Weapon.staff.cost)
  }

  func test_WeaponEnum_cost_sword_shouldBeEqual() throws {
    XCTAssertEqual(10, Weapon.sword.cost)
  }

  func test_WeaponEnum_cost_twoHandedSword_shouldBeEqual() throws {
    XCTAssertEqual(15, Weapon.twoHandedSword.cost)
  }

  func test_WeaponEnum_cost_warHammer_shouldBeEqual() throws {
    XCTAssertEqual(5, Weapon.warHammer.cost)
  }

  // weight
  func test_WeaponEnum_weight_battleAxe_shouldBeEqual() throws {
    XCTAssertEqual(50, Weapon.battleAxe.weight)
  }

  func test_WeaponEnum_weight_club_shouldBeEqual() throws {
    XCTAssertEqual(50, Weapon.club.weight)
  }

  func test_WeaponEnum_weight_crossbow_shouldBeEqual() throws {
    XCTAssertEqual(50, Weapon.crossbow.weight)
  }

  func test_WeaponEnum_weight_dagger_shouldBeEqual() throws {
    XCTAssertEqual(10, Weapon.dagger.weight)
  }

  func test_WeaponEnum_weight_handAxe_shouldBeEqual() throws {
    XCTAssertEqual(30, Weapon.handAxe.weight)
  }

  func test_WeaponEnum_weight_javelin_shouldBeEqual() throws {
    XCTAssertEqual(20, Weapon.javelin.weight)
  }

  func test_WeaponEnum_weight_lance_shouldBeEqual() throws {
    XCTAssertEqual(120, Weapon.lance.weight)
  }

  func test_WeaponEnum_weight_longBow_shouldBeEqual() throws {
    XCTAssertEqual(30, Weapon.longBow.weight)
  }

  func test_WeaponEnum_weight_mace_shouldBeEqual() throws {
    XCTAssertEqual(30, Weapon.mace.weight)
  }

  func test_WeaponEnum_weight_poleArm_shouldBeEqual() throws {
    XCTAssertEqual(150, Weapon.poleArm.weight)
  }

  func test_WeaponEnum_weight_shortBow_shouldBeEqual() throws {
    XCTAssertEqual(30, Weapon.shortBow.weight)
  }

  func test_WeaponEnum_weight_shortSword_shouldBeEqual() throws {
    XCTAssertEqual(30, Weapon.shortSword.weight)
  }

  func test_WeaponEnum_weight_silverDagger_shouldBeEqual() throws {
    XCTAssertEqual(10, Weapon.silverDagger.weight)
  }

  func test_WeaponEnum_weight_sling_shouldBeEqual() throws {
    XCTAssertEqual(20, Weapon.sling.weight)
  }

  func test_WeaponEnum_weight_spear_shouldBeEqual() throws {
    XCTAssertEqual(30, Weapon.spear.weight)
  }

  func test_WeaponEnum_weight_staff_shouldBeEqual() throws {
    XCTAssertEqual(40, Weapon.staff.weight)
  }

  func test_WeaponEnum_weight_sword_shouldBeEqual() throws {
    XCTAssertEqual(60, Weapon.sword.weight)
  }

  func test_WeaponEnum_weight_twoHandedSword_shouldBeEqual() throws {
    XCTAssertEqual(150, Weapon.twoHandedSword.weight)
  }

  func test_WeaponEnum_weight_warHammer_shouldBeEqual() throws {
    XCTAssertEqual(30, Weapon.warHammer.weight)
  }

  // damage
  func test_WeaponEnum_damage_battleAxe_shouldBeEqual() throws {
    XCTAssertEqual(Die.die8, Weapon.battleAxe.damage)
  }

  func test_WeaponEnum_damage_club_shouldBeEqual() throws {
    XCTAssertEqual(Die.die4, Weapon.club.damage)
  }

  func test_WeaponEnum_damage_crossbow_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, Weapon.crossbow.damage)
  }

  func test_WeaponEnum_damage_dagger_shouldBeEqual() throws {
    XCTAssertEqual(Die.die4, Weapon.dagger.damage)
  }

  func test_WeaponEnum_damage_handAxe_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, Weapon.handAxe.damage)
  }

  func test_WeaponEnum_damage_javelin_shouldBeEqual() throws {
    XCTAssertEqual(Die.die4, Weapon.javelin.damage)
  }

  func test_WeaponEnum_damage_lance_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, Weapon.lance.damage)
  }

  func test_WeaponEnum_damage_longBow_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, Weapon.longBow.damage)
  }

  func test_WeaponEnum_damage_mace_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, Weapon.mace.damage)
  }

  func test_WeaponEnum_damage_poleArm_shouldBeEqual() throws {
    XCTAssertEqual(Die.die10, Weapon.poleArm.damage)
  }

  func test_WeaponEnum_damage_shortBow_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, Weapon.shortBow.damage)
  }

  func test_WeaponEnum_damage_shortSword_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, Weapon.shortSword.damage)
  }

  func test_WeaponEnum_damage_silverDagger_shouldBeEqual() throws {
    XCTAssertEqual(Die.die4, Weapon.silverDagger.damage)
  }

  func test_WeaponEnum_damage_sling_shouldBeEqual() throws {
    XCTAssertEqual(Die.die4, Weapon.sling.damage)
  }

  func test_WeaponEnum_damage_spear_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, Weapon.spear.damage)
  }

  func test_WeaponEnum_damage_staff_shouldBeEqual() throws {
    XCTAssertEqual(Die.die4, Weapon.staff.damage)
  }

  func test_WeaponEnum_damage_sword_shouldBeEqual() throws {
    XCTAssertEqual(Die.die8, Weapon.sword.damage)
  }

  func test_WeaponEnum_damage_twoHandedSword_shouldBeEqual() throws {
    XCTAssertEqual(Die.die10, Weapon.twoHandedSword.damage)
  }

  func test_WeaponEnum_damage_warHammer_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, Weapon.warHammer.damage)
  }

  // qualities
  func test_WeaponEnum_qualities_battleAxe_shouldBeEqual() throws {
    XCTAssertEqual([Quality.melee, Quality.slow, Quality.twoHanded], Weapon.battleAxe.qualities)
  }

  func test_WeaponEnum_qualities_club_shouldBeEqual() throws {
    XCTAssertEqual([Quality.blunt, Quality.melee], Weapon.club.qualities)
  }

  func test_WeaponEnum_qualities_crossbow_shouldBeEqual() throws {
    XCTAssertEqual([Quality.missile, Quality.reload, Quality.slow, Quality.twoHanded], Weapon.crossbow.qualities)
  }

  func test_WeaponEnum_qualities_dagger_shouldBeEqual() throws {
    XCTAssertEqual([Quality.melee, Quality.missile], Weapon.dagger.qualities)
  }

  func test_WeaponEnum_qualities_handAxe_shouldBeEqual() throws {
    XCTAssertEqual([Quality.melee, Quality.missile], Weapon.handAxe.qualities)
  }

  func test_WeaponEnum_qualities_javelin_shouldBeEqual() throws {
    XCTAssertEqual([Quality.missile], Weapon.javelin.qualities)
  }

  func test_WeaponEnum_qualities_lance_shouldBeEqual() throws {
    XCTAssertEqual([Quality.charge, Quality.melee], Weapon.lance.qualities)
  }

  func test_WeaponEnum_qualities_longBow_shouldBeEqual() throws {
    XCTAssertEqual([Quality.missile, Quality.twoHanded], Weapon.longBow.qualities)
  }

  func test_WeaponEnum_qualities_mace_shouldBeEqual() throws {
    XCTAssertEqual([Quality.blunt, Quality.melee], Weapon.mace.qualities)
  }

  func test_WeaponEnum_qualities_poleArm_shouldBeEqual() throws {
    XCTAssertEqual([Quality.brace, Quality.melee, Quality.slow, .twoHanded], Weapon.poleArm.qualities)
  }

  func test_WeaponEnum_qualities_shortBow_shouldBeEqual() throws {
    XCTAssertEqual([Quality.missile, Quality.twoHanded], Weapon.shortBow.qualities)
  }

  func test_WeaponEnum_qualities_shortSword_shouldBeEqual() throws {
    XCTAssertEqual([Quality.melee], Weapon.shortSword.qualities)
  }

  func test_WeaponEnum_qualities_silverDagger_shouldBeEqual() throws {
    XCTAssertEqual([Quality.melee, Quality.missile], Weapon.silverDagger.qualities)
  }

  func test_WeaponEnum_qualities_sling_shouldBeEqual() throws {
    XCTAssertEqual([Quality.blunt, Quality.missile], Weapon.sling.qualities)
  }

  func test_WeaponEnum_qualities_spear_shouldBeEqual() throws {
    XCTAssertEqual([Quality.brace, Quality.melee, Quality.missile], Weapon.spear.qualities)
  }

  func test_WeaponEnum_qualities_staff_shouldBeEqual() throws {
    XCTAssertEqual([Quality.blunt, Quality.melee, Quality.slow, .twoHanded], Weapon.staff.qualities)
  }

  func test_WeaponEnum_qualities_sword_shouldBeEqual() throws {
    XCTAssertEqual([Quality.melee], Weapon.sword.qualities)
  }

  func test_WeaponEnum_qualities_twoHandedSword_shouldBeEqual() throws {
    XCTAssertEqual([Quality.melee, Quality.slow, Quality.twoHanded], Weapon.twoHandedSword.qualities)
  }

  func test_WeaponEnum_qualities_warHammer_shouldBeEqual() throws {
    XCTAssertEqual([Quality.blunt, Quality.melee], Weapon.warHammer.qualities)
  }

  // range
  func test_WeaponEnum_range_battleAxe_shouldBeEqual() throws {
    XCTAssertEqual("None", Weapon.battleAxe.range)
  }

  func test_WeaponEnum_range_club_shouldBeEqual() throws {
    XCTAssertEqual("None", Weapon.club.range)
  }

  func test_WeaponEnum_range_crossbow_shouldBeEqual() throws {
    XCTAssertEqual("(5'–80' / 81'–160' / 161'–240')", Weapon.crossbow.range)
  }

  func test_WeaponEnum_range_dagger_shouldBeEqual() throws {
    XCTAssertEqual("(5'-10' / 11'-20' / 21'-30')", Weapon.dagger.range)
  }

  func test_WeaponEnum_range_handAxe_shouldBeEqual() throws {
    XCTAssertEqual("(5'-10' / 11'-20' / 21'-30')", Weapon.handAxe.range)
  }

  func test_WeaponEnum_range_javelin_shouldBeEqual() throws {
    XCTAssertEqual("(5'-30' / 31'-60' / 61'-90')", Weapon.javelin.range)
  }

  func test_WeaponEnum_range_lance_shouldBeEqual() throws {
    XCTAssertEqual("None", Weapon.lance.range)
  }

  func test_WeaponEnum_range_longBow_shouldBeEqual() throws {
    XCTAssertEqual("(5'–70' / 71'–140' / 141'–210')", Weapon.longBow.range)
  }

  func test_WeaponEnum_range_mace_shouldBeEqual() throws {
    XCTAssertEqual("None", Weapon.mace.range)
  }

  func test_WeaponEnum_range_poleArm_shouldBeEqual() throws {
    XCTAssertEqual("None", Weapon.poleArm.range)
  }

  func test_WeaponEnum_range_shortBow_shouldBeEqual() throws {
    XCTAssertEqual("(5'–50' / 51'–100' / 101'–150')", Weapon.shortBow.range)
  }

  func test_WeaponEnum_range_shortSword_shouldBeEqual() throws {
    XCTAssertEqual("None", Weapon.shortSword.range)
  }

  func test_WeaponEnum_range_silverDagger_shouldBeEqual() throws {
    XCTAssertEqual("(5'-10' / 11'-20' / 21'-30')", Weapon.silverDagger.range)
  }

  func test_WeaponEnum_range_sling_shouldBeEqual() throws {
    XCTAssertEqual("(5'–40' / 41'–80' / 81'–160')", Weapon.sling.range)
  }

  func test_WeaponEnum_range_spear_shouldBeEqual() throws {
    XCTAssertEqual("(5'–20' / 21'–40' / 41'–60')", Weapon.spear.range)
  }

  func test_WeaponEnum_range_staff_shouldBeEqual() throws {
    XCTAssertEqual("None", Weapon.staff.range)
  }

  func test_WeaponEnum_range_sword_shouldBeEqual() throws {
    XCTAssertEqual("None", Weapon.sword.range)
  }

  func test_WeaponEnum_range_twoHandedSword_shouldBeEqual() throws {
    XCTAssertEqual("None", Weapon.twoHandedSword.range)
  }

  func test_WeaponEnum_range_warHammer_shouldBeEqual() throws {
    XCTAssertEqual("None", Weapon.warHammer.range)
  }

  // imgName
  func test_WeaponEnum_imgName_battleAxe_shouldBeEqual() throws {
    XCTAssertEqual("wBattleAxe", Weapon.battleAxe.imgName)
  }

  func test_WeaponEnum_imgName_club_shouldBeEqual() throws {
    XCTAssertEqual("wClub", Weapon.club.imgName)
  }

  func test_WeaponEnum_imgName_crossbow_shouldBeEqual() throws {
    XCTAssertEqual("wCrossbow", Weapon.crossbow.imgName)
  }

  func test_WeaponEnum_imgName_dagger_shouldBeEqual() throws {
    XCTAssertEqual("wDagger", Weapon.dagger.imgName)
  }

  func test_WeaponEnum_imgName_handAxe_shouldBeEqual() throws {
    XCTAssertEqual("wHandAxe", Weapon.handAxe.imgName)
  }

  func test_WeaponEnum_imgName_javelin_shouldBeEqual() throws {
    XCTAssertEqual("wJavelin", Weapon.javelin.imgName)
  }

  func test_WeaponEnum_imgName_lance_shouldBeEqual() throws {
    XCTAssertEqual("wLance", Weapon.lance.imgName)
  }

  func test_WeaponEnum_imgName_longBow_shouldBeEqual() throws {
    XCTAssertEqual("wLongBow", Weapon.longBow.imgName)
  }

  func test_WeaponEnum_imgName_mace_shouldBeEqual() throws {
    XCTAssertEqual("wMace", Weapon.mace.imgName)
  }

  func test_WeaponEnum_imgName_poleArm_shouldBeEqual() throws {
    XCTAssertEqual("wPoleArm", Weapon.poleArm.imgName)
  }

  func test_WeaponEnum_imgName_shortBow_shouldBeEqual() throws {
    XCTAssertEqual("wShortBow", Weapon.shortBow.imgName)
  }

  func test_WeaponEnum_imgName_shortSword_shouldBeEqual() throws {
    XCTAssertEqual("wShortSword", Weapon.shortSword.imgName)
  }

  func test_WeaponEnum_imgName_silverDagger_shouldBeEqual() throws {
    XCTAssertEqual("wSilverDagger", Weapon.silverDagger.imgName)
  }

  func test_WeaponEnum_imgName_sling_shouldBeEqual() throws {
    XCTAssertEqual("wSling", Weapon.sling.imgName)
  }

  func test_WeaponEnum_imgName_spear_shouldBeEqual() throws {
    XCTAssertEqual("wSpear", Weapon.spear.imgName)
  }

  func test_WeaponEnum_imgName_staff_shouldBeEqual() throws {
    XCTAssertEqual("wStaff", Weapon.staff.imgName)
  }

  func test_WeaponEnum_imgName_sword_shouldBeEqual() throws {
    XCTAssertEqual("wSword", Weapon.sword.imgName)
  }

  func test_WeaponEnum_imgName_twoHandedSword_shouldBeEqual() throws {
    XCTAssertEqual("wTwoHandedSword", Weapon.twoHandedSword.imgName)
  }

  func test_WeaponEnum_imgName_warHammer_shouldBeEqual() throws {
    XCTAssertEqual("wWarHammer", Weapon.warHammer.imgName)
  }
}
// swiftlint:enable type_body_length
// swiftlint:enable file_length
