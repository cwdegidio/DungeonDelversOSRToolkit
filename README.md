# DungeonDelversOSRToolkit
A toolkit for OSR games based on the B/X edition of the world's most popular role-playing game.

## App Description
**OSR Toolkit** is an app that is used to create and store first level character for use in playing the world's most popular roleplaying game using the B/X rules published in 1981. The app uses a slightly refined rules implementation based on Necrotic Gnome's *Old- School Essentials* (using the [OSE System Reference Document](https://oldschoolessentials.necroticgnome.com/srd/index.php/Main_Page) released under the [Open Gaming License](https://oldschoolessentials.necroticgnome.com/srd/index.php/⧼Open_Game_License⧽)).

## Application Flow
Following the loading screen and a short onboarding presentation, **OSR Toolkit** has three main areas:
1. Create a new character
2. View local character vault
3. View characters on Dungeon Cloud

### Create a new character
Character creation follows a simple workflow to eliminate any issues with creating a character. The flow goes as follows:

1. **Generating Abilities**
Ability scores are the foundation to numerous character aspects and the basis of many calculation made during the course of the game. When initially viewed, the player is given the option roll all their abilities at once. Following this, they may select individual abilities and reroll that specific stat. There is no limitations on rerolls as various house rules may be in effect (ex: reroll all scores under 8, only reroll 2 abilities of the players choice, etc).<br/><br/>In addition, the user may look at modifiers that the stat influences with a short description of each modifier and its effect on game play.

2. **Choosing a Class**
Following rolling abilities, a player chooses their character class. Each class in the TabView also allow the player to view more information about the presented class' features. Once a class has been selected, the player may advance.

3. **Ability Score Adjustments**
Players can increase their experience point awards based on how high their character classes Prime Requisite (denoted by the `*`) score is. In this section there are important rules that must be followed (these are managed by the application as well):
    1. The Prime Requisite score *cannot* be raised over 18.
    2. A non-Prime Requisite score may **not** be raised over its original starting value.
    3. Reducing a non-Prime Requisite score by 2 points allows the player to purchase a single point in their Prime Requisite.
    4. *Unless special rules for a class apply*, only Strength, Intelligence and Wisdom may be lowered. 
    
    Once a user is satisfied with their score adjustments, they may continue.

4. **Character Details**
Using the die specified by the character's class +/- their Constitution bonus, Hit Points are rolled.<br/>
Next the starting gold is rolled for the player. This will be used later when purchasing equipment and supplies.<br/>
Finally, the player chooses their Alignment (think of this as their view of the nature of the universe). The default choice is *Law*.

5. **Character Biography**
A user can now name their character. This is required to continue. Additional honorifics or titles may also be indicated here, although this field is optional. Languages the player knows in additional to the languages of their character class are selected. The number of available languages to choose is indicated.

6. **Equipment**
Players may purchase armor, weapons, and gear. After purchasing an item, remaining gold is indicated on the item detail page. If the user desires, they may return the item and be refunded. An inventory tab is provided to see a list of all purchased goods. After all purchases are made, the player may continue to the character review screen.

7. **Character Review**
This screen allows the user to view the various character sheet calculations and data that would normally be found on the Character Record sheet.

8. **Save Character**
The user is given the option to save the character locally to the device, save to the cloud, and/or abandon the character and return to the home screen.

### View local character vault
This screen will present the user with a list of characters saved locally to the device. A character can be chosen to view its character review screen. 

### View characters on Dragon Cloud
This screen allows users to see which characters are available on Dragon Cloud. Selecting a specific character will review the characters review screen

## Rubric Details

- Application was created using XCode 15 and iOS 17.
- Repository includes this README file.
- The app uses no third-party frameworks
- The app includes an animated launch screen (fade-in text, animation on goblin's face). 
**Files of note:** `DungeonDelversOSRToolkit/SplashScreen.swift`
- No unfinished features were included.
- The Equipment step of character creation includes multiple Lists embedded in a TabView with 5 tabs.
**Folder of Note**:  `DungeonDelversOSRToolkit/Views/CharacterCreation/7-Equipment`
- Each item in the lists mentioned include a name, a subtitle (or cost), and an image.
    - Tapping on any item in the Equipment lists will provide a detail view with more information about the item and allow for purchase.
    - All lists in the tabs (with the exception of Armor) are long enough to require scrolling.
- The application network service used to make use of the Dragon Cloud API is a keyless, public API.
**File of Note:** `DungeonDelversOSRToolkit/Services/CloudDataManager.swift`
- API is not rate limited.
- App allows for the saving of newly created characters to local device and cloud.
**Files of Note**: `DungeonDelversOSRToolkit/Services/CloudDataManager.swift`, `DungeonDelversOSRToolkit/Services/LocalStorageFileManager.swift`
- `@MainActor` was used in various places within the application. 
**Files of Note:** `DungeonDelversOSRToolkit/ViewModels/CharacterSaveViewModel.swift`, `DungeonDelversOSRToolkit/ViewModels/CloudCharacterVaultViewModel.swift`
A `DispatchQueue` was necessary in `DungeonDelversOSRToolkit/Views/CharacterCreation/7-Equipment/Equipment.swift` and `DungeonDelversOSRToolkit/SplashScreen.swift` due to not being able to get the required logic to work with a `Task`. This will be refactored in the future.
- User feedback via visual indicates help the user understand when they are unable to continue and an action is required. You may feel lost simply due to not understanding the rules of the game! Sorry! 🥲
- All screens work succesfully, without crashes
    - Views tested on SE (2nd Generation) -> 15 Pro
    - Works in Dark Mode
    - No obvious UI issues
- Code is organized and readable.
    - When necessary to disable swiftlint, comments are left to indicate why.
    - App builds with no warnings or errors.
    (One error that could not be solved involved the Previews in the buttons view. The Previews were removed because many hours were spent trying to find the issue and I am confident it was an XCode bug.)
- Unit tests cover 50% of the codebase. UI tests are absent as no amount of playing with various settings proposed by StackOverflow and other forum sources could get UI testing to work and I was losing time. I believe this may be an issue with my environment and will be troubleshooting this as I find it vary irritating. I beg mercy on this point 🙏🙏🙏. I'm tired and hit a wall fighting with it... lol.
- App includes:
    - custom icon
    - onboarding views
    - custom display name
    - multiple swiftUI animations
    - styled text
 
