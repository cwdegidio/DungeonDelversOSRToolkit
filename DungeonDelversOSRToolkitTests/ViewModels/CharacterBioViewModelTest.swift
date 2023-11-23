//
//  CharacterBioViewModelTest.swift
//  DungeonDelversOSRToolkitTests
//
//  Created by Curtis DeGidio on 11/23/23.
//

import XCTest
@testable import DungeonDelversOSRToolkit

final class CharacterBioViewModelTest: XCTestCase {
  func test_CharacterBioViewModel_getNumberOfLanguages_hasScore_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let languageLimit = viewModel.getNumberOfLanguages(for: player)
    XCTAssertEqual(3, languageLimit)
  }

  func test_CharacterBioViewModel_getNumberOfLanguages_doesNotHaveScore_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    player.abilityScores.removeAll { $0.statType == .int }
    let languageLimit = viewModel.getNumberOfLanguages(for: player)
    XCTAssertEqual(0, languageLimit)
  }

  func test_CharacterBioViewModel_getNumberOfLanguages_doesNotHaveModifier_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    player.modifiers.removeAll { $0.modType == .spokenLanguage }
    let languageLimit = viewModel.getNumberOfLanguages(for: player)
    XCTAssertEqual(0, languageLimit)
  }

  func test_CharacterBioViewModel_generateLanuageList_asFighter_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.characterClass = .fighter
    let languageList = viewModel.generateLanguageList(for: player)
    let languagesToTest: [Language] = [
      .bugbear,
      .doppelganger,
      .dragon,
      .dwarvish,
      .elvish,
      .gargoyle,
      .gnoll,
      .gnomish,
      .goblin,
      .halfling,
      .harpy,
      .hobgoblin,
      .kobold,
      .lizardMan,
      .medussa,
      .minotaur,
      .ogre,
      .orcish,
      .pixie,
      .humanDialect
    ]
    XCTAssertEqual(languagesToTest, languageList)
  }

  func test_CharacterBioViewModel_generateLanuageList_asDwarf_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.characterClass = .dwarf
    let languageList = viewModel.generateLanguageList(for: player)
    let languagesToTest: [Language] = [
      .bugbear,
      .doppelganger,
      .dragon,
      .elvish,
      .gargoyle,
      .gnoll,
      .halfling,
      .harpy,
      .hobgoblin,
      .lizardMan,
      .medussa,
      .minotaur,
      .ogre,
      .orcish,
      .pixie,
      .humanDialect
    ]
    XCTAssertEqual(languagesToTest, languageList)
  }

  func test_CharacterBioViewModel_generateLanuageList_asElf_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.characterClass = .elf
    let languageList = viewModel.generateLanguageList(for: player)
    let languagesToTest: [Language] = [
      .bugbear,
      .doppelganger,
      .dragon,
      .dwarvish,
      .gargoyle,
      .gnomish,
      .goblin,
      .halfling,
      .harpy,
      .kobold,
      .lizardMan,
      .medussa,
      .minotaur,
      .ogre,
      .pixie,
      .humanDialect
    ]
    XCTAssertEqual(languagesToTest, languageList)
  }

  func test_CharacterBioViewModel_generateLanuageList_asHalfling_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.characterClass = .halfling
    let languageList = viewModel.generateLanguageList(for: player)
    let languagesToTest: [Language] = [
      .bugbear,
      .doppelganger,
      .dragon,
      .dwarvish,
      .elvish,
      .gargoyle,
      .gnoll,
      .gnomish,
      .goblin,
      .harpy,
      .hobgoblin,
      .kobold,
      .lizardMan,
      .medussa,
      .minotaur,
      .ogre,
      .orcish,
      .pixie,
      .humanDialect
    ]
    XCTAssertEqual(languagesToTest, languageList)
  }

  func test_CharacterBioViewModel_generateLanuageList_noClass_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    let languageList = viewModel.generateLanguageList(for: player)
    XCTAssertEqual([], languageList)
  }

  func test_CharacterBioViewModel_updatePlayerLanguage_addLanguages_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.characterClass = .fighter
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let limit = viewModel.getNumberOfLanguages(for: player)
    viewModel.updatePlayerLanguages(using: .goblin, for: player, withLimit: limit)
    XCTAssertEqual([.goblin], player.additionalLanguages)
  }

  func test_CharacterBioViewModel_updatePlayerLanguage_removeLanguages_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.characterClass = .fighter
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let limit = viewModel.getNumberOfLanguages(for: player)
    viewModel.updatePlayerLanguages(using: .goblin, for: player, withLimit: limit)
    viewModel.updatePlayerLanguages(using: .gnoll, for: player, withLimit: limit)
    viewModel.updatePlayerLanguages(using: .kobold, for: player, withLimit: limit)
    viewModel.updatePlayerLanguages(using: .goblin, for: player, withLimit: limit)
    XCTAssertEqual([.gnoll, .kobold], player.additionalLanguages)
  }

  func test_CharacterBioViewModel_generateSelectedLanguagesString_hasLanguages_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.characterClass = .fighter
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let limit = viewModel.getNumberOfLanguages(for: player)
    viewModel.updatePlayerLanguages(using: .goblin, for: player, withLimit: limit)
    viewModel.updatePlayerLanguages(using: .gnoll, for: player, withLimit: limit)
    viewModel.updatePlayerLanguages(using: .kobold, for: player, withLimit: limit)
    let text = viewModel.generateSelectedLanguagesString(for: player)
    XCTAssertEqual("Goblin, Gnoll, Kobold", text)
  }

  func test_CharacterBioViewModel_generateSelectedLanguagesString_hasNoLanguages_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    player.characterClass = .fighter
    player.abilityScores = [
      CharacterAbility(statType: .str, score: 18),
      CharacterAbility(statType: .dex, score: 9),
      CharacterAbility(statType: .con, score: 8),
      CharacterAbility(statType: .int, score: 18),
      CharacterAbility(statType: .wis, score: 10),
      CharacterAbility(statType: .cha, score: 12)
    ]
    let limit = viewModel.getNumberOfLanguages(for: player)
    let text = viewModel.generateSelectedLanguagesString(for: player)
    XCTAssertEqual("None", text)
  }

  func test_CharacterBioViewModel_setValueonPlayer_shouldBeEqual() {
    let viewModel = CharacterBioViewModel()
    var player = PlayerCharacter()
    viewModel.setValueonPlayer(onfield: &player.name, withText: "Gandalf")
    XCTAssertEqual("Gandalf", player.name)
  }
}
