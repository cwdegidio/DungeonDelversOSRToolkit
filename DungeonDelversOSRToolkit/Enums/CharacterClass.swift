//
//  CharacterClass.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

enum CharacterClass: CaseIterable {
  case cleric
  case dwarf
  case elf
  case fighter
  case halfling
  case magicUser
  case thief

  var name: String {
    switch self {
    case .cleric:
      return "Cleric"
    case .dwarf:
      return "Dwarf"
    case .elf:
      return "Elf"
    case .fighter:
      return "Fighter"
    case .halfling:
      return "Halfling"
    case .magicUser:
      return "Magic-User"
    case .thief:
      return "Thief"
    }
  }

  var symbol: String {
    switch self {
    case .cleric:
      return "cross.circle"
    case .dwarf:
      return "mountain.2.fill"
    case .elf:
      return "tree.fill"
    case .fighter:
      return "shield.checkered"
    case .halfling:
      return "laurel.trailing"
    case .magicUser:
      return "fireworks"
    case .thief:
      return "lock.open.fill"
    }
  }

  var description: String {
    switch self {
    case .cleric:
      return "Clerics are adventurers who have sworn to serve a deity. " +
        "They are trained for battle and channel the power of their deity."
    case .dwarf:
      return "Dwarves are known for their stubbornness and practicality. " +
        "They are a hardy people and have a strong resistance to magic."
    case .elf:
      return "Elves are fascinated by spells and beautifully constructed magic items and love to collect both."
    case .fighter:
      return "Fighters are adventurers dedicated to mastering the arts of combat and war."
    case .halfling:
      return "Halflings are a friendly and welcoming folk. " +
        "Above all, they love the comforts of home and are not known for their bravery."
    case .magicUser:
      return "Magic-users are adventurers whose study of arcane secrets has taught them how to cast spells."
    case .thief:
      return "Thieves are adventurers who live by their skills of deception and stealth. " +
        "Their range of unique skills makes them very handy companions in adventures."
    }
  }

  var requirements: [(Stat, Int)]? {
    switch self {
    case .cleric, .fighter, .magicUser, .thief:
      return nil
    case .dwarf:
      return [(.con, 9)]
    case .halfling:
      return [(.con, 9), (.dex, 9)]
    case .elf:
      return [(.int, 9)]
    }
  }

  var primeRequisite: [Stat] {
    switch self {
    case .cleric:
      return [.wis]
    case .dwarf, .fighter:
      return [.str]
    case .elf:
      return [.int, .str]
    case .halfling:
      return [.dex, .str]
    case .magicUser:
      return [.int]
    case .thief:
      return [.dex]
    }
  }

  var armour: String {
    switch self {
    case .cleric, .dwarf, .elf, .fighter:
      return "Any, including shields"
    case .halfling:
      return "Any appropriate to size, including shields"
    case .magicUser:
      return "None"
    case .thief:
      return "Leather, no shields"
    }
  }

  var weapons: String {
    switch self {
    case .cleric:
      return "Any blunt weapons"
    case .dwarf:
      return "Small or normal sized"
    case .elf, .fighter, .thief:
      return "Any"
    case .halfling:
      return "Any appropriate to size"
    case .magicUser:
      return "Dagger"
    }
  }

  var languages: [Language] {
    switch self {
    case .cleric, .fighter, .magicUser, .thief:
      return [.alignment, .common]
    case .dwarf:
      return [.alignment, .common, .dwarvish, .gnomish, .goblin, .kobold]
    case .elf:
      return [.alignment, .common, .elvish, .gnoll, .hobgoblin, .orcish]
    case .halfling:
      return [.alignment, .common, .halfling]
    }
  }

  var classFeatures: String {
    var primeReqString = ""

    for i in 0..<primeRequisite.count {
      if i == 0 {
        primeReqString.append(primeRequisite[i].name)
      } else {
        primeReqString.append(", \(primeRequisite[i].name)")
      }
    }

    switch self {
    case .cleric:
      return "Prime Requisite(s): \(primeReqString)\n" +
        "Combat: Clerics can use all types of armour. " +
        "They may use the following weapons: club, mace, sling, staff, war hammer.\n" +
        "Divine Magic\n- **Holy symbol:** A cleric must carry a holy symbol.\n\t" +
        "Deity disfavor: Clerics who fall from favour with their deity may incur penalties.\n\t" +
        "Magical research: A cleric of any level may spend time and money on magical research.\n\t" +
        "Spell casting: Once a cleric has proven their faith, the character may pray to receive spells.\n\t" +
        "Using magic items: As spell casters, clerics can use magic scrolls of spells on their spell list.\n" +
        "Turning Undead: Clerics can invoke the power of their deity to repel undead monsters encountered.\n" +
        "After Reaching 9th Level: A cleric may establish or build a strong- hold."
    case .dwarf:
      return "Combat: Dwarves can use all types of armour. " +
        "Due to their short height, dwarves can only use small or normal sized weapons. " +
        "They cannot use longbows or two-handed swords.\n" +
        "Detect Construction Tricks: As expert miners, dwarves have a 2-in- 6 chance of being able to detect " +
        "new construction, sliding walls, or sloping passages when searching.\n" +
        "Detect Room Traps:** Due to their expertise with construction, dwarves have a 2-in-6 chance of detecting " +
        "non-magical room traps when searching.\n" +
        "- Infravision: Dwarves have infravision to 60’.\n" +
        "- **Listening at Doors:** Dwarves have a 2-in-6 chance of hear- ing noises.\n" +
        "- **After Reaching 9th Level:** A dwarf has the option of creating an underground stronghold " +
        "that will attract dwarves from far and wide."
    case .elf:
      return ""
    case .fighter:
      return ""
    case .halfling:
      return ""
    case .magicUser:
      return ""
    case .thief:
      return ""
    }
  }

  var hitDie: Int {
    switch self {
    case .magicUser, .thief:
      return 4
    case .cleric, .elf, .halfling:
      return 6
    case .dwarf, .fighter:
      return 8
    }
  }

  var srdURL: String {
    switch self {
    case .cleric:
      return "https://oldschoolessentials.necroticgnome.com/srd/index.php/Cleric"
    case .dwarf:
      return "https://oldschoolessentials.necroticgnome.com/srd/index.php/Dwarf"
    case .elf:
      return "https://oldschoolessentials.necroticgnome.com/srd/index.php/Elf"
    case .fighter:
      return "https://oldschoolessentials.necroticgnome.com/srd/index.php/Fighter"
    case .halfling:
      return "https://oldschoolessentials.necroticgnome.com/srd/index.php/Halfling"
    case .magicUser:
      return "https://oldschoolessentials.necroticgnome.com/srd/index.php/Magic-User"
    case .thief:
      return "https://oldschoolessentials.necroticgnome.com/srd/index.php/Thief"
    }
  }
}
