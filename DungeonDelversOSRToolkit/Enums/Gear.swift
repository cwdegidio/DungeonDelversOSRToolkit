//
//  Gear.swift
//  DungeonDelversOSRToolkit
//
//  Created by Curtis DeGidio on 11/24/23.
//

import Foundation

enum Gear: String, Purchasable, CaseIterable, Codable {
  case backpack
  case crowbar
  case garlic
  case grapplingHook
  case hammer
  case holySymbol
  case holyWater
  case ironSpikes
  case lantern
  case mirror
  case oil
  case pole
  case rationsIron
  case rationsStandard
  case rope
  case sackLarge
  case sackSmall
  case stakesAndMallet
  case thievesTools
  case tinderBox
  case torches
  case waterskin
  case wine
  case wolfsbane

  var name: String {
    switch self {
    case .backpack:
      return "Backpack"
    case .crowbar:
      return "Crowbar"
    case .garlic:
      return "Garlic"
    case .grapplingHook:
      return "Grappling Hook"
    case .hammer:
      return "Hammer (small)"
    case .holySymbol:
      return "Holy Symbol"
    case .holyWater:
      return "Holy water (vial)"
    case .ironSpikes:
      return "Iron spikes (12)"
    case .lantern:
      return "Lantern"
    case .mirror:
      return "Mirror (hand-sized, steel)"
    case .oil:
      return "Oil (1 flask)"
    case .pole:
      return "Pole (10' long, wooden)"
    case .rationsIron:
      return "Rations (iron, 7 days)"
    case .rationsStandard:
      return "Rations (standard, 7 days)"
    case .rope:
      return "Rope (50')"
    case .sackLarge:
      return "Sack (large)"
    case .sackSmall:
      return "Sack (small)"
    case .stakesAndMallet:
      return "Stakes (3) and mallet"
    case .thievesTools:
      return "Thieves' tools"
    case .tinderBox:
      return "Tinder box (flint & steel)"
    case .torches:
      return "Torches (6)"
    case .waterskin:
      return "Waterskin"
    case .wine:
      return "Wine (2 pints)"
    case .wolfsbane:
      return "Wolfsbane (1 bunch)"
    }
  }

  var cost: Int {
    switch self {
    case .ironSpikes, .pole, .rope, .sackSmall, .torches, .waterskin, .wine:
      return 1
    case .hammer, .oil, .sackLarge:
      return 2
    case .stakesAndMallet, .tinderBox:
      return 3
    case .backpack, .garlic, .mirror, .rationsStandard:
      return 5
    case .crowbar, .lantern, .wolfsbane:
      return 10
    case .rationsIron:
      return 15
    case .grapplingHook, .holySymbol, .holyWater, .thievesTools:
      return 25
    }
  }

  var description: String {
    switch self {
    case .backpack:
      return "Has two straps and can be worn on the back, keeping the hands free. Holds up to 400 coins."
    case .crowbar:
      return "2–3' long and made of solid iron. Can be used for forcing doors and other objects open."
    case .garlic:
      return "A single head of fresh garlic. Helpful for warding off certain undead."
    case .grapplingHook:
      return "Has 3 or 4 prongs. Can be used for anchoring a rope."
    case .hammer:
      return "Can be used for construction or as a mallet with iron or wooden spikes."
    case .holySymbol:
      return "A divine spell caster is required to own a holy symbol of their deity, " +
      "often worn as a necklace. Each religion has its own holy symbol."
    case .holyWater:
      return "Water that has been blessed by a holy person. " +
      "It is used in some religious rituals and inflicts damage on undead monsters. " +
      "Holy water does not retain its power if stored in any other container than the special vials it is blessed in."
    case .ironSpikes:
      return "May be used for wedging doors open or shut, as an anchor to attach a rope to, and many other purposes."
    case .lantern:
      return "Can be closed to hide the light. " +
      "Burns one oil flask every four hours (24 turns). Casts light in a 30' radius."
    case .mirror:
      return "Useful for looking around corners or for reflecting a gaze attack."
    case .oil:
      return "A flask of oil fuels a lantern for four hours (24 turns). " +
      "In addition to fuelling lanterns, oil can be used as a weapon."
    case .pole:
      return "A 2” thick wooden pole useful for poking and prodding suspicious items in a dungeon."
    case .rationsIron:
      return "Dried and preserved food to be carried on long voyages when securing fresh food may be uncertain."
    case .rationsStandard:
      return "Fresh, unpreserved food."
    case .rope:
      return "Can hold the weight of approximately three human-sized beings."
    case .sackLarge:
      return "Can hold up to 600 coins."
    case .sackSmall:
      return "Can hold up to 200 coins."
    case .stakesAndMallet:
      return "A wooden mallet and three 18\" long stakes. Valuable when confronting vampires."
    case .thievesTools:
      return "This kit contains all of the tools needed to pick locks."
    case .tinderBox:
      return "Used to light fires, including torches. Using a tinder box takes one round. " +
      "There is a 2-in-6 chance of success per round."
    case .torches:
      return "A torch burns for 1 hour (6 turns), clearly illuminating a 30' radius. " +
      "Torches may also be used in combat."
    case .waterskin:
      return "This container, made of hide, will hold 2 pints (1 quart) of fluid."
    case .wine:
      return "A simple wine of average quality."
    case .wolfsbane:
      return "This herb can be used to repel lycanthropes. The creature must be hit with the herb in melee combat."
    }
  }

  var imgName: String {
    switch self {
    case .backpack:
      return "gBackpack"
    case .crowbar:
      return "gCrowbar"
    case .garlic:
      return "gGarlic"
    case .grapplingHook:
      return "gGrapplinghook"
    case .hammer:
      return "gHammer"
    case .holySymbol:
      return "gHolySymbol"
    case .holyWater:
      return "gHolyWater"
    case .ironSpikes:
      return "gIronSpikes"
    case .lantern:
      return "gLantern"
    case .mirror:
      return "gMirror"
    case .oil:
      return "gOil"
    case .pole:
      return "gPole"
    case .rationsIron:
      return "gRationsIron"
    case .rationsStandard:
      return "gRationsStandard"
    case .rope:
      return "gRope"
    case .sackLarge:
      return "gSackLarge"
    case .sackSmall:
      return "gSackSmall"
    case .stakesAndMallet:
      return "gStakeAndMallet"
    case .thievesTools:
      return "gThievesTools"
    case .tinderBox:
      return "gTinderBox"
    case .torches:
      return "gTorch"
    case .waterskin:
      return "gWaterskin"
    case .wine:
      return "gWine"
    case .wolfsbane:
      return "gWolfsbane"
    }
  }
}
