# IT265 Design Treatment Checkpoint

---

## Title
Advance!

---

## Concept Statement
Asymmetric turn-based strategy where one player defends one end of the board while trying to get information and take down the other player before they can reach their side.

---

## Genre and Style

### Genre
Strategy, Action

### Style
A lighthearted but grounded theme, cartoony visuals with strategic, slow paced gameplay akin to chess.

---

## Target Audience

### Demographics
Young or casual strategy gamers.
### Accessibility
Optional rules to increase/decrease difficulty. House rules allow for on-the-fly balancing tailored to individual players.
Individual board pieces will be distinct from each other to aid the visually impaired. Most gameplay will be about planning ahead and keeping track of information rather than mechanical skill.

### Inclusivity Strategies
This game could promote inclusivity with cosmetic packs for the digital version, or by increasing unit variety through the use of mixed ethnicities and genders.

---

## Core Gameplay Mechanics

### Primary Mechanics
Asymmetrical, attacker vs defender. - adds variety, replayability, and increased opportunities for skill expression.
Informational asymmetry, attacker can see entire board, defender cannot. - Increases skill expression for both sides, managing information becomes a core skill. For example, As the attacker, knowing what the defender does and does not know becomes an important skill.
Random events via dice roll. - Adds controlled randomness which can greatly aid a player depending on their skill, prevents the game from playing out the same way each time.

### Goals and Challenges
Defender must defend their side of the board with a limited set of powerful units. They are unable to see what is occuring on the attackers side of the board, but the attacker must give them certain information based on their actions.
  - Attacker must state if one of their units is in the line of sight of the defending units. In this case, that unit is lost. Defender must keep track of how many units are left.
  - Defender rolls one dice on their turn for a random event. Events can include the ability to place an impassable tile to hinder enemy movement, or forcibly reveal the position of a unit.
  - Attacker must reach the opposite side of the board by moving their units without them being seen. Attacker must manage their information and maintain secrecy in order to avoid detection
  - Impassable tiles block both attacking unit movement and defending unit line of sight.
Asymmetrical gameplay forces players to interact civilly despite competing, controls tension and aids replayability in the form of rematches (swap sides).

### Progression
As the players progress, the board state evolves. Impassable tiles pile up, the amount of information to track grows, units are lost for the defender.
The game ends once either all the attacking units are destroyed or an attacking unit successfully reaches the defending side of the board. 

### Game Rules
Attacker and defender take turns, alternating. The attacker moves first, advancing each of their units by a certain amount of grid spaces in any direction, distance governed by the unit type.
On defender turn, defender may choose to move their defending units left or right by a limited number of spaces. If an attacking unit is in the line of sight of the defending unit, the attacker loses that unit.
On the end of either the attacking or defending turn, a dice is rolled for a chance at a random event.
The defender may roll for a chance to: forcibly reveal an enemy unit, place an impassable tile, gain an extra move for one of their units, place a small AOE attack anywhere on the grid.
The attacker may roll for a chance to: gain an extra move for one of their units, gain an extra unit which is placed at the far end of the board from the defender, place an impassable tile, or freeze a defending unit.
Dice rolls may result in no event occuring.
Board is divided into a grid where all units and tiles reside in a grid space. Line of sight is determined by grid column. Some attacking units may be larger than one grid space.

---

## Story and Setting

### Setting
Game world has little unique lore, just a generic battle of attrition like many in world war 1. Attacking / defending side may consist of units inspired by real life WWI factions.

### Plot
The players play as commanders on each side of the battle, directing their units to victory by defending or capturing an objective.

### Characters
Characters consist of the units each side plays.
Defender: 
- Defending unit: A rifleman with a long line of sight, but limited movement. They occupy 1x1 grid spaces, and can only move 1 or 2 (TBD) tiles at a time. These units are deployed at the start of the game and cannot be destroyed or gained.
Attacker:
- Attacking Rifleman: A weak but numerous unit. Attacker starts with multiple of these. They occupy 1x1 grid spaces, and can only move 1 or 2 (TBD) tiles at a time.
- Attacking Truck: A fast but large unit. Attacker starts with one of these. Serves to increase tension at the start of the game. They occupy 2x3 Grid spaces, but can move many tiles at a time. Are signifigantly more limited when moving left or right.

---

## Unique Selling Points (USP)
Not many board games are asymmetric, and even less (that are not card-based) have limited information as a selling point. This game aims to be a breath of fresh air in the market of strategical board games.

---

## Inspiration
Battleship.

### Sources
WWI, Battleship.
<!-- 
List books, movies, historical events, or games that influenced this project. 
-->

### Why It Matters
Battleship inspired the information gap, and World War One inspired the gameplay loop, and visual theme.

---

## Player Experience Goals
Intended player emotions include anxiety, and satisfaction.
Anxiety - Constant self-guessing over possible missed information, not knowing where the attacking units are as a defender, losing track of what the defender knows as an attacker.
Satisfaction - Defender successfully catching the attacker and destroying their units, attacker outplaying the defender and dodging their lines of sights.

---

## Technical Requirements

### Platform
Game could support PC, console and mobile. Cross-platform support could even be universal.
Could support VR, but would likely be boring.

### Tools
Potentially could be played via terminal with ASCII graphics.
Otherwise, 2D game development enviornment like Godot. 

---

## Art and Sound Direction

### Visual Style
Cartoony visual style with bright colors which may contrast the theme, in effort of promoting a lighthearted theme.
UI elements would be simple, art direction would be cartoony and simple as well.

### Sound Design
Sound effects could aid in information gathering through sound cues. Music may hinder or enhance focus for certain individuals, may aid an intense atmosphere in late-game scenarios.

---

## Monetization Strategy
Paid cosmetic packs, skins for the battlefield, units.

---

## Treatment Details

### Gameplay Example
Turn #, Action.
1. Attacker advances each of their units forward, attempting to move away from denfender line of sight and out of defending movement range.
1. Defender moves their units to the sides, attempting to catch attacking units while moving.
2. Attacker advances units further. Rolls and gains an extra movement. Advances their truck further up, causing it to be much further than the rest of their units.
2. Defender moves their units again. Catches an attacking rifleman. Rolls for mandatory unit reveal. Requests attacker reveals furthest advances unit.
3. Attacker attempts to move truck to the side to avoid defender.
3. Defender moves units to last known truck position, potentially offsetting to catch them in retreat. Succeeds and destroys truck.
4-8. Attacker and defender exchange turns, placing impassable tiles strategically to block advances and lines of sight. Defender narrows down possible attacking unit positions with tactical placement.
9. Attacker is on last unit, which is behind an impassable tile. Defender moves their units to block both sides of impassable tile, preventing movement. Defender has now won the game.
---

### Challenges and Considerations

#### Potential Risks
Game could potentially be grossly imbalanced depending on the amount of attacking/defending units, movement distance, board size, special event commonality.

#### Feasibility
Board game may struggle to maintain information defecit for defender. Defender may peek around barriers. Attacker may lie about their unit positions. 
Risks could be minimized by implementing cheaters punishments; punishments in game that occur if a player is caught cheating. This will not be necessary in a digital implementation.

---

## Visualizing the Game Concept

### Concept Sketches or Storyboards
- Provide at least **two sketches**  
- Ensure sketches accurately represent the game’s concept and theme  
- Maintain coherence with the game’s style and theme  

<!-- 
Upload sketches here, or describe the key visual elements in detail if unavailable. 
-->

---

## Pitch Preparation

### Pitch Summary
A board game with a focus on asymmetrical gameplay. Set in world war one, one player attacks while the other defends. The defending player must use deduction skills to determine the attacker's position in the fog of war, while the attacking player must tactfully avoid detection until they can reach and destroy the defender.

### Target Audience Appeal
This game should be easy to learn, hard to master, perfect for casual and young gamers due to its lack of intense themes. This game should be unique to players without ready access to more complex strategy games, be it through inexperience from age or resources like devices or money. (civilization is expensive)

### Market Differentiation
This game is unique because of its asymmetrical gameplay combined with information deductive skillset. It is akin to battleship, but asymmetric. 

---

## External Feedback
<!-- Duplicate Feedback group as necessary if beyond 3 -->

### Feedback 1
- **Reviewer**:  
  <!-- Enter name and relation to you -->
- **Summary**:  
  <!-- Summarize feedback focusing on concept, mechanics, and style -->
- **Refinement**:  
  <!-- Explain how this feedback will improve the design -->

### Feedback 2
- **Reviewer**:  
  <!-- Enter name and relation to you -->
- **Summary**:  
  <!-- Summarize feedback focusing on concept, mechanics, and style -->
- **Refinement**:  
  <!-- Explain how this feedback will improve the design -->

### Feedback 3
- **Reviewer**:  
  <!-- Enter name and relation to you -->
- **Summary**:  
  <!-- Summarize feedback focusing on concept, mechanics, and style -->
- **Refinement**:  
  <!-- Explain how this feedback will improve the design -->


---

## Appendix
<!-- 
Include any additional sketches, mood boards, or early design mockups if available.  
If digital assets are unavailable, describe any rough concepts you have in mind. 
-->

---
