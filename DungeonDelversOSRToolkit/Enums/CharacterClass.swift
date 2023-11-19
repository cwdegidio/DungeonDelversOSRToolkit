//
//  CharacterClass.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/14/23.
//

import Foundation

// swiftlint:disable type_body_length
// All character class data is stored in enum due to regular reference
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
      return "figure.climbing"
    }
  }

  var description: String {
    switch self {
    case .cleric:
      return "Clerics are adventurers who have sworn to serve a deity. "
    case .dwarf:
      return "Dwarves are known for their stubbornness and practicality."
    case .elf:
      return "Elves are fascinated by spells and beautifully constructed magic items and love to collect both."
    case .fighter:
      return "Fighters are adventurers dedicated to mastering the arts of combat and war."
    case .halfling:
      return "Halflings are a friendly and welcoming folk."
    case .magicUser:
      return "Magic-users are adventurers whose study of arcane secrets has taught them how to cast spells."
    case .thief:
      return "Thieves are adventurers who live by their skills of deception and stealth."
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

  var classFeatures: KeyValuePairs<String, String> {
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
      return [
        "Prime Requisite(s)": primeReqString,
        "Combat": "Clerics can use all types of armour. " +
        "They may use the following weapons: club, mace, sling, staff, war hammer.",
        "Divine Magic": "**Holy symbol:** A cleric must carry a holy symbol.\n" +
        "**Deity disfavor**: Clerics who fall from favour with their deity may incur penalties.\n" +
        "**Spell casting**: Once a cleric has proven their faith, the character may pray to receive spells.\n" +
        "**Using magic items**: As spell casters, clerics can use magic scrolls of spells on their spell list.",
        "Turning Undead": "Clerics can invoke the power of their deity to repel undead monsters encountered.",
        "After Reaching 9th Level": "A cleric may establish or build a strong- hold."
      ]
    case .dwarf:
      return [
        "Prime Requisite(s)": primeReqString,
        "Combat": "Dwarves can use all types of armour. " +
        "Due to their short height, dwarves can only use small or normal sized weapons. " +
        "They cannot use longbows or two-handed swords.",
        "Detect Construction Tricks": "As expert miners, dwarves have a 2-in- 6 chance of being able to detect " +
        "new construction, sliding walls, or sloping passages when searching.",
        "Detect Room Traps": "Due to their expertise with construction, dwarves have a 2-in-6 chance of detecting " +
        "non-magical room traps when searching.",
        "Infravision": "Dwarves have infravision to 60’",
        "Listening at Doors": "Dwarves have a 2-in-6 chance of hearing noises.",
        "After Reaching 9th Level": "A dwarf has the option of creating an underground stronghold " +
        "that will attract dwarves from far and wide."
      ]
    case .elf:
      return [
        "Prime Requisite(s)": primeReqString,
        "Combat": "Elves can use all types of weapons and armour.",
        "Arcane Magic": "**Magical Research:** An elf of any level may spend time and money on magical research.\n" +
        "**Spell casting:** Elves carry spell books containing the formulae for arcane spells.\n" +
        "**Use magic items:** As spell casters, elves are able to use magic scrolls of spells on their spell list.",
        "Detect Secret Doors": "When actively searching, an can detect hidden and secret doors with a 2-in-6 chance.",
        "Immunity to Ghoul Paralysis": "Elves are completely unaffected by the paralysis that ghouls can inflict.",
        "Infravision": "Elves have infravision to 60’",
        "Listening at Doors": "Elves have a 2-in-6 chance of hearing noises",
        "After Reaching 9th Level": "An elf may construct a stronghold in the depths of the forest"
      ]
    case .fighter:
      return [
        "Prime Requisite(s)": primeReqString,
        "Combat": "Fighters can use all types of weapons and armour.",
        "Stronghold": "Any time a fighter wishes, they can build a castle or stronghold",
        "After Reaching 9th Level": "A fighter may be granted a title such as Baron or Baroness."
      ]
    case .halfling:
      return [
        "Prime Requisite(s)": primeReqString,
        "Combat": "Halflings can use all types of armour, but it must be tailored to their small size. " +
        "They cannot use long- bows or two-handed swords.",
        "Defensive Bonus": "Due to their small size, halflings gain a +2 bonus " +
        "to Armour Class when attacked by large opponents.",
        "Hiding": "Halflings have an uncanny ability to disappear from sight. " +
        "In woods or undergrowth, a halfling can hide with a 90% chance of success. " +
        "In dungeons, a halfling can hide in shadows or behind other forms of cover. The chance of success is 2-in-6.",
        "Initiative Bonus": "Halflings get a bonus of +1 to initiative rolls.",
        "Listening at Doors": "Halflings have a 2-in-6 chance of hear- ing noises.",
        "Missile Attack Bonus": "+1 bonus to attack rolls with all missile weapons.",
        "Stronghold": "Any time a halfling wishes (and has sufficient money), they may build a stronghold, " +
        "which will form the basis of a new community of halflings."
      ]
    case .magicUser:
      return [
        "Prime Requisite(s)": primeReqString,
        "Combat": "Magic-users can only use daggers and are unable to use shields or wear any kind of armour.",
        "Arcane Magic": "**Magical Research:** A magic-user of any level " +
        "may spend time and money on magical research.\n" +
        "**Spell casting:** Magic-users carry spell books containing the formulae for arcane spells.\n" +
        "**Use magic items:** As spell casters, magic-users are able to use magic scrolls " +
        "of spells on their spell list."
      ]
    case .thief:
      return [
        "Prime Requisite(s)": primeReqString,
        "Combat": "Thieves cannot wear armour heavier than leather and cannot use shields. They can use any weapon.",
        "Back-Stab": "When attacking an unaware opponent from behind, a thief receives a +4 bonus " +
        "to hit and doubles any damage dealt.",
        "Read Languages": "A thief of 4th level or higher can read non-magical text in any language.",
        "Scroll Use": "A thief of 10th level or higher can cast arcane spells from scrolls.",
        "Thief Skills": "**Climb sheer surfaces**, **Find or remove treasure traps**, **Hear noise**, " +
        "**Hide in shadows**, **Move silently**, **Open locks**, **Pick pockets**",
        "After Reaching 9th Level": "A thief can establish a thief den, attract- ing 2d6 apprentices of 1st level. " +
        "These thieves will serve the character with some reliability"
      ]
    }
  }

  var hitDie: Die {
    switch self {
    case .magicUser, .thief:
      return .die4
    case .cleric, .elf, .halfling:
      return .die6
    case .dwarf, .fighter:
      return .die8
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

  var imgName: String {
    switch self {
    case .cleric:
      return "chCleric"
    case .dwarf:
      return "chDwarf"
    case .elf:
      return "chElf"
    case .fighter:
      return "chFighter"
    case .halfling:
      return "chHalfling"
    case .magicUser:
      return "chMagicUser"
    case .thief:
      return "chThief"
    }
  }
}
// swiftlint:enable type_body_length
