# Game Name: Advance!
Genre: Strategy/Social Deduction
Game Elements: Strategic, asymetrical gameplay that tests a players wit and tactical prowess.
Players: 2
TECHNICAL SPECS
Technical Form: 2D
View: Top-Down
Platform: PC 
Language: GDscript
Device: PC
GAME PLAY
Two players, one attacker, one defender. The attacker must move their pieces up the playing field towards the defender's line. The defending units fire blindly
onto the field at the end of the defender's turn, revealing any attacking units they hit, and destroying them. Both sides may periodically place impassable tiles to
give themselves an advantage, or, in the defender's case, for misdirection. The defender wins by eliminating all threats, the attacker wins by getting one unit to the
defender's line without being eliminated.
Game Play Outline
  Defender setup: Defender places their pieces on their row, definining their starting positions and allowing the defender and attacker to plan around initial placement.
  Attacker setup: Attacker places their pieces on the furthest two rows. They are immediately exposed to, but hidden from the defender.
  Dice Roll: A d3 is rolled. If the roll is 1, the defender may place an impassable tile that blocks both attacker movement and defender 
            line of sight through that tile. The tile may be placed anywhere that is not the defender's row or the furthest two rows. Rolls of 2 or 3 do nothing.
  Defender turn: Defender moves their pieces left or right 0-2 spaces. Once moved, the unit fires onto the field. Any attackers in that row are destroyed, revealed, 
                 and become impassable to the defender. If the defender kills all of the remaining attacking units, the defender wins.
  Dice Roll: A d3 is rolled. If the roll is 1, an impassable tile may be placed anywhere that is not the defender's row, which blocks both attacker movement and defender
             line of sight through that tile. The attacker may optionally opt to remove an impassable tile instead, including corpses. Rolls of 2 or 3 do nothing.
  Attacker turn: The attacker moves each of their alive pieces 1 tile in any orthogonal direction, or they may opt to not move. If a piece is moved to the row
                 immediately prior to the defenders row, the attacker wins.
Key Features
Key features are a list of game elements that are attractive to the player.
DESIGN DOCUMENT
This document describes how GameObjects behave, how they’re controlled and their properties. This is often referred to as
the “mechanics” of the game. This documentation is primarily concerned with
the game itself. This part of the document is meant to be modular, meaning you could have
several different Game Design Documents attached to the Concept Document.
Design Guidelines
This is an important statement about any creative restrictions that need to be considered and includes brief statements
about the general (i.e., overall) goal of the design.
Game Design Definitions
This section established the definition of the game play. Definitions should include how a player wins, loses, transitions
between levels, and the main focus of the gameplay.
Game Flowchart
The game flowchart provides a visual of how the different game elements and their properties interact. Game flowcharts
should represent Objects, Properties, and Actions present in the game. Each of these items should have a number reference
to where they exist within the game mechanics document.
• Menu
• Synopsis
• Game Play
• Player Control
• Game Over (Winning and Losing
Player Definition
● Use this section for quick descriptions that define the player
● Use the Player Properties section (below) to define the properties for each player. Player Properties can be
affected by the player’s action or interaction with other game elements. Define the properties and how they affect
the player’s current game.
● Use the Player Rewards section to make a list of all objects that affect the player in a positive way. Define these
objects by describing what affect they cause and how the player can use the object.
Player Definitions
A suggested list may include:
• Health
• Weapons
• Actions
Player Properties
Each property should mention a feedback as a result of the property changing.
Player Rewards (power-ups and pick-ups)
Make a list of all objects that affect the player in a positive way (e.g., health replenished)
User Interface (UI)
This is where you’ll include a description of the user’s control of the game. Think about which buttons on a device would be
best suited for the game. Consider what the worst layout is, then ask yourself if your UI is it still playable. A visual
representation can be added where you relate the physical controls to the actions in the game. When designing the UI, it may
be valuable to research quality control and user interface (UI) design information.
