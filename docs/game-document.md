# Game Name: Advance!
Genre: Strategy/Social Deduction

Game Elements: Strategic, asymetrical gameplay that tests a players wit and tactical prowess.

Players: 2

# TECHNICAL SPECS
Technical Form: 2D

View: Top-Down

Platform: PC 

Language: GDscript

Device: PC

# GAME PLAY
Two players, one attacker, one defender. The attacker must move their pieces up the playing field towards the defender's line. The defending units fire blindly
onto the field at the end of the defender's turn, revealing any attacking units they hit, and destroying them. Both sides may periodically place impassable tiles to
give themselves an advantage, or, in the defender's case, for misdirection. The defender wins by eliminating all threats, the attacker wins by getting one unit to the defender's line without being eliminated.
# # Game Play Outline
  Defender setup: Defender places their pieces on their row, definining their starting positions and allowing the defender and attacker to plan around initial placement.
  Attacker setup: Attacker places their pieces on the furthest two rows. They are immediately exposed to, but hidden from the defender.
  Dice Roll: A d3 is rolled. If the roll is 1, the defender may place an impassable tile that blocks both attacker movement and defender line of sight through that tile. The tile may be placed anywhere that is not the defender's row or the furthest two rows. Rolls of 2 or 3 do nothing.
  Defender turn: Defender moves their pieces left or right 0-2 spaces. Once moved, the unit fires onto the field. Any attackers in that row are destroyed, revealed, and become impassable to the defender. If the defender kills all of the remaining attacking units, the defender wins.
  Dice Roll: A d3 is rolled. If the roll is 1, an impassable tile may be placed anywhere that is not the defender's row, which blocks both attacker movement and defender line of sight through that tile. The attacker may optionally opt to remove an impassable tile instead, including corpses. Rolls of 2 or 3 do nothing.
  Attacker turn: The attacker moves each of their alive pieces 1 tile in any orthogonal direction, or they may opt to not move. If a piece is moved to the row immediately prior to the defenders row, the attacker wins.
  Repeat from first dice roll until either team wins.
# Key Features
Asymetrical gameplay, short rounds with simple concepts. 
# DESIGN DOCUMENT
Defending units may move two spaces left or right on their turn on the topmost row. Destroys any unit on their column when moved. Destroyed units become impassable but can still be seen through. Pieces behind impassable "rock" tiles are protected from destruction. 
Attacking units may move one space in any orthogonal direction on their turn. They are initially placed in the bottom two rows. They may not move through impassable tiles. When destroyed, they become impassable corpse tiles.
Impassable rock tiles cannot be moved or seen through. They have a chance to be placed by either team before the start of their turn, or may be destroyed by the attacking team.
# Design Guidelines
Pieces should be understandable as units belonging to either team, and impassable tiles should be recognizable as impassable through texture or other design elements. The board should be simple and contrast enough with the units to make them visibly recognizable.
# User Interface (UI)
Board is controlled through clicking to select / place units, and pressing the R key to reset after a game is won. The screen contains the board, an instruction label, and an error label. The instruction label displays the current player, and an outline of their expected actions. The error label is hidden until the player attempts an invalid action. The error label will provide instructive guidance on the proper action to take. At the end of a turn, a popup will appear, hiding the board and informing the player to pass the device to the next player. Once passed, the new player can acknowledge the popup, which reveals the board and switches to the relevant state.
