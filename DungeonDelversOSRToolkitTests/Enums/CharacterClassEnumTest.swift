//
//  CharacterClassEnumTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/30/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit
// swiftlint:disable file_length
// swiftlint:disable type_body_length
// Keeping test logic together
final class CharacterClassEnumTest: XCTestCase {
  // Name
  func test_CharacterClassEnum_name_cleric_shouldBeEqual() throws {
    XCTAssertEqual("Cleric", CharacterClass.cleric.name)
  }

  func test_CharacterClassEnum_name_dwarf_shouldBeEqual() throws {
    XCTAssertEqual("Dwarf", CharacterClass.dwarf.name)
  }

  func test_CharacterClassEnum_name_elf_shouldBeEqual() throws {
    XCTAssertEqual("Elf", CharacterClass.elf.name)
  }

  func test_CharacterClassEnum_name_fighter_shouldBeEqual() throws {
    XCTAssertEqual("Fighter", CharacterClass.fighter.name)
  }

  func test_CharacterClassEnum_name_halfling_shouldBeEqual() throws {
    XCTAssertEqual("Halfling", CharacterClass.halfling.name)
  }

  func test_CharacterClassEnum_name_magicUser_shouldBeEqual() throws {
    XCTAssertEqual("Magic-User", CharacterClass.magicUser.name)
  }

  func test_CharacterClassEnum_name_thief_shouldBeEqual() throws {
    XCTAssertEqual("Thief", CharacterClass.thief.name)
  }

  // Symbol
  func test_CharacterClassEnum_symbol_cleric_shouldBeEqual() throws {
    XCTAssertEqual("cross.circle", CharacterClass.cleric.symbol)
  }

  func test_CharacterClassEnum_symbol_dwarf_shouldBeEqual() throws {
    XCTAssertEqual("mountain.2.fill", CharacterClass.dwarf.symbol)
  }

  func test_CharacterClassEnum_symbol_elf_shouldBeEqual() throws {
    XCTAssertEqual("tree.fill", CharacterClass.elf.symbol)
  }

  func test_CharacterClassEnum_symbol_fighter_shouldBeEqual() throws {
    XCTAssertEqual("shield.checkered", CharacterClass.fighter.symbol)
  }

  func test_CharacterClassEnum_symbol_halfling_shouldBeEqual() throws {
    XCTAssertEqual("laurel.trailing", CharacterClass.halfling.symbol)
  }

  func test_CharacterClassEnum_symbol_magicUser_shouldBeEqual() throws {
    XCTAssertEqual("fireworks", CharacterClass.magicUser.symbol)
  }

  func test_CharacterClassEnum_symbol_thief_shouldBeEqual() throws {
    XCTAssertEqual("figure.climbing", CharacterClass.thief.symbol)
  }

  // Description
  func test_CharacterClassEnum_description_cleric_shouldBeEqual() throws {
    XCTAssertEqual("Clerics are adventurers who have sworn to serve a deity. ", CharacterClass.cleric.description)
  }

  func test_CharacterClassEnum_description_dwarf_shouldBeEqual() throws {
    XCTAssertEqual("Dwarves are known for their stubbornness and practicality.", CharacterClass.dwarf.description)
  }

  func test_CharacterClassEnum_description_elf_shouldBeEqual() throws {
    XCTAssertEqual(
      "Elves are fascinated by spells and beautifully constructed " +
      "magic items and love to collect both.",
      CharacterClass.elf.description
    )
  }

  func test_CharacterClassEnum_description_fighter_shouldBeEqual() throws {
    XCTAssertEqual(
      "Fighters are adventurers dedicated to mastering the arts of combat and war.",
      CharacterClass.fighter.description
    )
  }

  func test_CharacterClassEnum_description_halfling_shouldBeEqual() throws {
    XCTAssertEqual(
      "Halflings are a friendly and welcoming folk.",
      CharacterClass.halfling.description
    )
  }

  func test_CharacterClassEnum_description_magicUser_shouldBeEqual() throws {
    XCTAssertEqual(
      "Magic-users are adventurers whose study of arcane secrets has taught them how to cast spells.",
      CharacterClass.magicUser.description
    )
  }

  func test_CharacterClassEnum_description_thief_shouldBeEqual() throws {
    XCTAssertEqual(
      "Thieves are adventurers who live by their skills of deception and stealth.",
      CharacterClass.thief.description
    )
  }

  // Requirements
  func test_CharacterClassEnum_requirements_cleric_fighter_magicUser_thief_shouldBeEqual() throws {
    XCTAssertNil(CharacterClass.cleric.requirements)
    XCTAssertNil(CharacterClass.fighter.requirements)
    XCTAssertNil(CharacterClass.magicUser.requirements)
    XCTAssertNil(CharacterClass.thief.requirements)
  }

  // swiftlint:disable force_unwrapping
  // keeping tests simple
  func test_CharacterClassEnum_requirements_dwarf_shouldBeEqual() throws {
    XCTAssertEqual(Stat.con, CharacterClass.dwarf.requirements![0].0)
    XCTAssertEqual(9, CharacterClass.dwarf.requirements![0].1)
  }

  func test_CharacterClassEnum_requirements_halfling_shouldBeEqual() throws {
    XCTAssertEqual(Stat.con, CharacterClass.halfling.requirements![0].0)
    XCTAssertEqual(9, CharacterClass.halfling.requirements![0].1)
    XCTAssertEqual(Stat.dex, CharacterClass.halfling.requirements![1].0)
    XCTAssertEqual(9, CharacterClass.halfling.requirements![1].1)
  }

  func test_CharacterClassEnum_requirements_elf_shouldBeEqual() throws {
    XCTAssertEqual(Stat.int, CharacterClass.elf.requirements![0].0)
    XCTAssertEqual(9, CharacterClass.elf.requirements![0].1)
  }
  // swiftlint:enable force_unwrapping

  // Prime Requisite
  func test_CharacterClassEnum_primeReq_cleric_shouldBeEqual() throws {
    XCTAssertEqual(Stat.wis, CharacterClass.cleric.primeRequisite[0])
  }

  func test_CharacterClassEnum_primeReq_fighter_shouldBeEqual() throws {
    XCTAssertEqual(Stat.str, CharacterClass.fighter.primeRequisite[0])
  }

  func test_CharacterClassEnum_primeReq_dwarf_shouldBeEqual() throws {
    XCTAssertEqual(Stat.str, CharacterClass.dwarf.primeRequisite[0])
  }

  func test_CharacterClassEnum_primeReq_elf_shouldBeEqual() throws {
    XCTAssertEqual(Stat.int, CharacterClass.elf.primeRequisite[0])
    XCTAssertEqual(Stat.str, CharacterClass.elf.primeRequisite[1])
  }

  func test_CharacterClassEnum_primeReq_halfling_shouldBeEqual() throws {
    XCTAssertEqual(Stat.dex, CharacterClass.halfling.primeRequisite[0])
    XCTAssertEqual(Stat.str, CharacterClass.halfling.primeRequisite[1])
  }

  func test_CharacterClassEnum_primeReq_magicUser_shouldBeEqual() throws {
    XCTAssertEqual(Stat.int, CharacterClass.magicUser.primeRequisite[0])
  }

  func test_CharacterClassEnum_primeReq_thief_shouldBeEqual() throws {
    XCTAssertEqual(Stat.dex, CharacterClass.thief.primeRequisite[0])
  }

  // armor
  func test_CharacterClassEnum_armor_cleric_shouldBeEqual() throws {
    XCTAssertEqual("Any, including shields", CharacterClass.cleric.armor)
  }

  func test_CharacterClassEnum_armor_dwarf_shouldBeEqual() throws {
    XCTAssertEqual("Any, including shields", CharacterClass.dwarf.armor)
  }

  func test_CharacterClassEnum_armor_elf_shouldBeEqual() throws {
    XCTAssertEqual("Any, including shields", CharacterClass.elf.armor)
  }

  func test_CharacterClassEnum_armor_fighter_shouldBeEqual() throws {
    XCTAssertEqual("Any, including shields", CharacterClass.fighter.armor)
  }

  func test_CharacterClassEnum_armor_halfling_shouldBeEqual() throws {
    XCTAssertEqual("Any appropriate to size, including shields", CharacterClass.halfling.armor)
  }

  func test_CharacterClassEnum_armor_magicUser_shouldBeEqual() throws {
    XCTAssertEqual("None", CharacterClass.magicUser.armor)
  }

  func test_CharacterClassEnum_armor_thief_shouldBeEqual() throws {
    XCTAssertEqual("Leather, no shields", CharacterClass.thief.armor)
  }

  // weapons
  func test_CharacterClassEnum_weapon_cleric_shouldBeEqual() throws {
    XCTAssertEqual("Any blunt weapons", CharacterClass.cleric.weapons)
  }

  func test_CharacterClassEnum_weapon_dwarf_shouldBeEqual() throws {
    XCTAssertEqual("Small or normal sized", CharacterClass.dwarf.weapons)
  }

  func test_CharacterClassEnum_weapon_elf_shouldBeEqual() throws {
    XCTAssertEqual("Any", CharacterClass.elf.weapons)
  }

  func test_CharacterClassEnum_weapon_fighter_shouldBeEqual() throws {
    XCTAssertEqual("Any", CharacterClass.fighter.weapons)
  }

  func test_CharacterClassEnum_weapon_halfling_shouldBeEqual() throws {
    XCTAssertEqual("Any appropriate to size", CharacterClass.halfling.weapons)
  }

  func test_CharacterClassEnum_weapon_magicUser_shouldBeEqual() throws {
    XCTAssertEqual("Dagger", CharacterClass.magicUser.weapons)
  }

  func test_CharacterClassEnum_weapon_thief_shouldBeEqual() throws {
    XCTAssertEqual("Any", CharacterClass.thief.weapons)
  }

  // langauges
  func test_CharacterClassEnum_language_cleric_shouldBeEqual() throws {
    XCTAssertEqual(Language.alignment, CharacterClass.cleric.languages[0])
    XCTAssertEqual(Language.common, CharacterClass.cleric.languages[1])
  }

  func test_CharacterClassEnum_language_fighter_shouldBeEqual() throws {
    XCTAssertEqual(Language.alignment, CharacterClass.fighter.languages[0])
    XCTAssertEqual(Language.common, CharacterClass.fighter.languages[1])
  }

  func test_CharacterClassEnum_language_magicUSer_shouldBeEqual() throws {
    XCTAssertEqual(Language.alignment, CharacterClass.magicUser.languages[0])
    XCTAssertEqual(Language.common, CharacterClass.magicUser.languages[1])
  }

  func test_CharacterClassEnum_language_thief_shouldBeEqual() throws {
    XCTAssertEqual(Language.alignment, CharacterClass.thief.languages[0])
    XCTAssertEqual(Language.common, CharacterClass.thief.languages[1])
  }

  func test_CharacterClassEnum_language_dwarf_shouldBeEqual() throws {
    XCTAssertEqual(Language.alignment, CharacterClass.dwarf.languages[0])
    XCTAssertEqual(Language.common, CharacterClass.dwarf.languages[1])
    XCTAssertEqual(Language.dwarvish, CharacterClass.dwarf.languages[2])
    XCTAssertEqual(Language.gnomish, CharacterClass.dwarf.languages[3])
    XCTAssertEqual(Language.goblin, CharacterClass.dwarf.languages[4])
    XCTAssertEqual(Language.kobold, CharacterClass.dwarf.languages[5])
  }

  func test_CharacterClassEnum_language_elf_shouldBeEqual() throws {
    XCTAssertEqual(Language.alignment, CharacterClass.elf.languages[0])
    XCTAssertEqual(Language.common, CharacterClass.elf.languages[1])
    XCTAssertEqual(Language.elvish, CharacterClass.elf.languages[2])
    XCTAssertEqual(Language.gnoll, CharacterClass.elf.languages[3])
    XCTAssertEqual(Language.hobgoblin, CharacterClass.elf.languages[4])
    XCTAssertEqual(Language.orcish, CharacterClass.elf.languages[5])
  }

  func test_CharacterClassEnum_language_halfling_shouldBeEqual() throws {
    XCTAssertEqual(Language.alignment, CharacterClass.halfling.languages[0])
    XCTAssertEqual(Language.common, CharacterClass.halfling.languages[1])
    XCTAssertEqual(Language.halfling, CharacterClass.halfling.languages[2])
  }

  // Class Features
  func test_CharacterClassEnum_classFeatures_cleric_shouldBeEqual() throws {
    XCTAssertEqual(5, CharacterClass.cleric.classFeatures.count)
  }

  func test_CharacterClassEnum_classFeatures_dwarf_shouldBeEqual() throws {
    XCTAssertEqual(7, CharacterClass.dwarf.classFeatures.count)
  }

  func test_CharacterClassEnum_classFeatures_elf_shouldBeEqual() throws {
    XCTAssertEqual(8, CharacterClass.elf.classFeatures.count)
  }

  func test_CharacterClassEnum_classFeatures_fighter_shouldBeEqual() throws {
    XCTAssertEqual(4, CharacterClass.fighter.classFeatures.count)
  }

  func test_CharacterClassEnum_classFeatures_halfling_shouldBeEqual() throws {
    XCTAssertEqual(8, CharacterClass.halfling.classFeatures.count)
  }

  func test_CharacterClassEnum_classFeatures_magicUser_shouldBeEqual() throws {
    XCTAssertEqual(3, CharacterClass.magicUser.classFeatures.count)
  }

  func test_CharacterClassEnum_classFeatures_thief_shouldBeEqual() throws {
    XCTAssertEqual(7, CharacterClass.thief.classFeatures.count)
  }

  // Hit Die
  func test_CharacterClassEnum_hitDie_cleric_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, CharacterClass.cleric.hitDie)
  }

  func test_CharacterClassEnum_hitDie_dwarf_shouldBeEqual() throws {
    XCTAssertEqual(Die.die8, CharacterClass.dwarf.hitDie)
  }

  func test_CharacterClassEnum_hitDie_elf_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, CharacterClass.elf.hitDie)
  }

  func test_CharacterClassEnum_hitDie_fighter_shouldBeEqual() throws {
    XCTAssertEqual(Die.die8, CharacterClass.fighter.hitDie)
  }

  func test_CharacterClassEnum_hitDie_halfling_shouldBeEqual() throws {
    XCTAssertEqual(Die.die6, CharacterClass.halfling.hitDie)
  }

  func test_CharacterClassEnum_hitDie_magicUser_shouldBeEqual() throws {
    XCTAssertEqual(Die.die4, CharacterClass.magicUser.hitDie)
  }

  func test_CharacterClassEnum_hitDie_thief_shouldBeEqual() throws {
    XCTAssertEqual(Die.die4, CharacterClass.thief.hitDie)
  }

  // SRD URL
  func test_CharacterClassEnum_srdURL_cleric_shouldBeEqual() throws {
    XCTAssertEqual("https://oldschoolessentials.necroticgnome.com/srd/index.php/Cleric", CharacterClass.cleric.srdURL)
  }

  func test_CharacterClassEnum_srdURL_dwarf_shouldBeEqual() throws {
    XCTAssertEqual("https://oldschoolessentials.necroticgnome.com/srd/index.php/Dwarf", CharacterClass.dwarf.srdURL)
  }

  func test_CharacterClassEnum_srdURL_elf_shouldBeEqual() throws {
    XCTAssertEqual("https://oldschoolessentials.necroticgnome.com/srd/index.php/Elf", CharacterClass.elf.srdURL)
  }

  func test_CharacterClassEnum_srdURL_fighter_shouldBeEqual() throws {
    XCTAssertEqual("https://oldschoolessentials.necroticgnome.com/srd/index.php/Fighter", CharacterClass.fighter.srdURL)
  }

  func test_CharacterClassEnum_srdURL_halfling_shouldBeEqual() throws {
    XCTAssertEqual("https://oldschoolessentials.necroticgnome.com/srd/index.php/Halfling", CharacterClass.halfling.srdURL)
  }

  func test_CharacterClassEnum_srdURL_magicUser_shouldBeEqual() throws {
    XCTAssertEqual("https://oldschoolessentials.necroticgnome.com/srd/index.php/Magic-User", CharacterClass.magicUser.srdURL)
  }

  func test_CharacterClassEnum_srdURL_thief_shouldBeEqual() throws {
    XCTAssertEqual("https://oldschoolessentials.necroticgnome.com/srd/index.php/Thief", CharacterClass.thief.srdURL)
  }

  // Image Name
  func test_CharacterClassEnum_imgName_cleric_shouldBeEqual() throws {
    XCTAssertEqual("chCleric", CharacterClass.cleric.imgName)
  }

  func test_CharacterClassEnum_imgName_dwarf_shouldBeEqual() throws {
    XCTAssertEqual("chDwarf", CharacterClass.dwarf.imgName)
  }

  func test_CharacterClassEnum_imgName_elf_shouldBeEqual() throws {
    XCTAssertEqual("chElf", CharacterClass.elf.imgName)
  }

  func test_CharacterClassEnum_imgName_fighter_shouldBeEqual() throws {
    XCTAssertEqual("chFighter", CharacterClass.fighter.imgName)
  }

  func test_CharacterClassEnum_imgName_halfling_shouldBeEqual() throws {
    XCTAssertEqual("chHalfling", CharacterClass.halfling.imgName)
  }

  func test_CharacterClassEnum_imgName_magicUser_shouldBeEqual() throws {
    XCTAssertEqual("chMagicUser", CharacterClass.magicUser.imgName)
  }

  func test_CharacterClassEnum_imgName_thief_shouldBeEqual() throws {
    XCTAssertEqual("chThief", CharacterClass.thief.imgName)
  }

  // Saving Throws
  func test_CharacterClassEnum_savingThrows_cleric_shouldBeEqual() throws {
    let savingThrows: [SavingThrow: Int] = [.death: 11, .wands: 12, .paralysis: 14, .breath: 16, .spells: 15]
    for (key, value) in savingThrows {
      XCTAssertEqual(CharacterClass.cleric.savingThrowsAtLevel1[key], value)
    }
  }

  func test_CharacterClassEnum_savingThrows_dwarf_shouldBeEqual() throws {
    let savingThrows: [SavingThrow: Int] = [.death: 8, .wands: 9, .paralysis: 10, .breath: 13, .spells: 12]
    for (key, value) in savingThrows {
      XCTAssertEqual(CharacterClass.dwarf.savingThrowsAtLevel1[key], value)
    }
  }

  func test_CharacterClassEnum_savingThrows_elf_shouldBeEqual() throws {
    let savingThrows: [SavingThrow: Int] = [.death: 12, .wands: 12, .paralysis: 13, .breath: 13, .spells: 15]
    for (key, value) in savingThrows {
      XCTAssertEqual(CharacterClass.elf.savingThrowsAtLevel1[key], value)
    }
  }

  func test_CharacterClassEnum_savingThrows_fighter_shouldBeEqual() throws {
    let savingThrows: [SavingThrow: Int] = [.death: 12, .wands: 13, .paralysis: 14, .breath: 15, .spells: 16]
    for (key, value) in savingThrows {
      XCTAssertEqual(CharacterClass.fighter.savingThrowsAtLevel1[key], value)
    }
  }

  func test_CharacterClassEnum_savingThrows_halfling_shouldBeEqual() throws {
    let savingThrows: [SavingThrow: Int] = [.death: 8, .wands: 9, .paralysis: 10, .breath: 13, .spells: 12]
    for (key, value) in savingThrows {
      XCTAssertEqual(CharacterClass.halfling.savingThrowsAtLevel1[key], value)
    }
  }

  func test_CharacterClassEnum_savingThrows_magicUser_shouldBeEqual() throws {
    let savingThrows: [SavingThrow: Int] = [.death: 12, .wands: 14, .paralysis: 13, .breath: 16, .spells: 15]
    for (key, value) in savingThrows {
      XCTAssertEqual(CharacterClass.magicUser.savingThrowsAtLevel1[key], value)
    }
  }

  func test_CharacterClassEnum_savingThrows_thief_shouldBeEqual() throws {
    let savingThrows: [SavingThrow: Int] = [.death: 13, .wands: 14, .paralysis: 13, .breath: 16, .spells: 15]
    for (key, value) in savingThrows {
      XCTAssertEqual(CharacterClass.thief.savingThrowsAtLevel1[key], value)
    }
  }

  // XP for Level 2
  func test_CharacterClassEnum_xpForLevel2_cleric_shouldBeEqual() throws {
    XCTAssertEqual(1500, CharacterClass.cleric.xpForLevel2)
  }

  func test_CharacterClassEnum_xpForLevel2_dwarf_shouldBeEqual() throws {
    XCTAssertEqual(2200, CharacterClass.dwarf.xpForLevel2)
  }

  func test_CharacterClassEnum_xpForLevel2_elf_shouldBeEqual() throws {
    XCTAssertEqual(4000, CharacterClass.elf.xpForLevel2)
  }

  func test_CharacterClassEnum_xpForLevel2_fighter_shouldBeEqual() throws {
    XCTAssertEqual(2000, CharacterClass.fighter.xpForLevel2)
  }

  func test_CharacterClassEnum_xpForLevel2_halfling_shouldBeEqual() throws {
    XCTAssertEqual(2000, CharacterClass.halfling.xpForLevel2)
  }

  func test_CharacterClassEnum_xpForLevel2_magicUser_shouldBeEqual() throws {
    XCTAssertEqual(2500, CharacterClass.magicUser.xpForLevel2)
  }

  func test_CharacterClassEnum_xpForLevel2_thief_shouldBeEqual() throws {
    XCTAssertEqual(1200, CharacterClass.thief.xpForLevel2)
  }
}
// swiftlint:enable type_body_length
// swiftlint:enable file_length
