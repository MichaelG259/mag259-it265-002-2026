extends Node2D

@onready var playertilemap = $GamePieceLayer
@onready var attackertilemap = $AttackerLayer
@onready var label = $InstructionLabel
@onready var errlabel = $ErrorLabel
@onready var acceptDialog = $AcceptDialog
@onready var validtilemap = $ValidTilesLayer
@onready var dicetilemap = $DiceLayer
@onready var prevdice = $DiceEffectPreviousLabel
@onready var dice = $DiceEffectLabel
var state = "uninitialized"
var inputcount = 0
var unitcountattacker = 4
var unitselected = false
var positionselected
var dicerolled
var doingspecial = false

#@TODO Convert to linked list for dynamic unit count
var defendingUnits = [Vector2i(-1,-1), Vector2i(-1,-1)]
var attackingUnits = [Vector2i(-1,-1), Vector2i(-1,-1), Vector2i(-1,-1), Vector2i(-1,-1)]
var defendingUnitsMoved = [false, false]
var attackingUnitsMoved = [false, false, false, false]
var attackingUnitsDead = [false, false, false, false]

#I am aware that reinitializing all these variables is inefficient, but I am lazy and this was the easiest way i knew how to implement a new game
func _ready() -> void:
	randomize()
	dicetilemap.enabled = false
	errlabel.text = "Game ready."
	state = "uninitialized"
	prevdice.text = ""
	dice.text = ""
	unitcountattacker = 4
	doingspecial = false
	unitselected = false
	positionselected = null
	defendingUnits = [Vector2i(-1,-1), Vector2i(-1,-1)]
	attackingUnits = [Vector2i(-1,-1), Vector2i(-1,-1), Vector2i(-1,-1), Vector2i(-1,-1)]
	defendingUnitsMoved = [false, false]
	attackingUnitsMoved = [false, false, false, false]
	attackingUnitsDead = [false, false, false, false]
	for x in range(-3,4):
		for y in range(-6,6):
			playertilemap.set_cell(Vector2i(x, y),-1,Vector2i(0,0))
			attackertilemap.set_cell(Vector2i(x, y), -1, Vector2i(0,0))
	var size = get_window().size
	acceptDialog.size.x = size.x
	acceptDialog.size.y = size.y
	advanceState()

func win(winningteam):
	clearSelected()
	if winningteam == 1:
		acceptDialog.dialog_text = "Defender wins!"
	else:
		acceptDialog.dialog_text = "Attacker wins!"
	attackertilemap.enabled = true
	state = "win"
	advanceState()
	acceptDialog.visible = true

func passDevice():
	acceptDialog.visible = true
	await acceptDialog.confirmed
	return true

func placeImpassable():
	for x in range(-3,4):
		for y in range(-5,4):
			if playertilemap.get_cell_source_id(Vector2i(x,y)) != 4 and playertilemap.get_cell_source_id(Vector2i(x,y)) != 5 and playertilemap.get_cell_source_id(Vector2i(x,y)) != 6:
				validtilemap.set_cell(Vector2i(x, y),3,Vector2i(0,0))

func placeOrDestroyImpassable():
	for x in range(-3,4):
		for y in range(-5,6):
			if attackertilemap.get_cell_source_id(Vector2i(x,y)) != 0:
				validtilemap.set_cell(Vector2i(x, y),3,Vector2i(0,0))

func resetTurn():
	inputcount = 0
	unitselected = false
	defendingUnitsMoved = [false, false]
	attackingUnitsMoved = [false, false, false, false]

func clearSelected():
	for x in range(-3,4):
		for y in range(-6,6):
			validtilemap.set_cell(Vector2i(x, y),-1,Vector2i(0,0))

func removeAttacker(coords, corpseID):	
	var attackingUnit = attackingUnits.find(coords)
	if attackingUnitsDead[attackingUnit] == false:
		print("Removed attacker at " + str(coords))
		attackertilemap.set_cell(coords, -1, Vector2i(0,0))
		unitcountattacker+=-1
		attackingUnitsDead[attackingUnit] = true
		playertilemap.set_cell(coords, corpseID, Vector2i(0,0))
		for u in attackingUnitsDead:
			if u == false:
				return false
		return true
	else:
		return false

func checkVisibleThrough(coords):
	if playertilemap.get_cell_source_id(coords) == 5 or playertilemap.get_cell_source_id(coords) == 6:
		return false
	return true

func checkSightline(coords):
	var ret = false
	for attackingUnit in attackingUnits:
		if coords.x == attackingUnit.x:
			for y in range(coords.y, attackingUnit.y):
				if not checkVisibleThrough(Vector2i(coords.x, y)):
					return false
			ret = removeAttacker(attackingUnit, 4)
	return ret

func cellPassable(cellCoords):
	if attackertilemap.get_cell_source_id(cellCoords) != 0 and playertilemap.get_cell_source_id(cellCoords) != 4 and playertilemap.get_cell_source_id(cellCoords) != 5 and playertilemap.get_cell_source_id(cellCoords) != 6:
		return true
	return false

func rollDice():
	dicetilemap.enabled = true
	prevdice.text = "Previous " + dice.text
	dicerolled = randi_range(0,3)
	dicetilemap.set_cell(Vector2i(0,0), dicerolled, Vector2i(0,0))

func checkValid(tilemousepos):
	if state == "setupDefender":
		if inputcount <= 2:
			if tilemousepos.y == -6:
				if playertilemap.get_cell_source_id(Vector2i(tilemousepos.x, tilemousepos.y)) != 1:
					playertilemap.set_cell(tilemousepos, 1, Vector2i(0,0)) 
					defendingUnits[inputcount] = Vector2i(tilemousepos.x, tilemousepos.y)
					inputcount+=1
					if inputcount == 2:
						return true
			else:
				errlabel.text = "Error: Not topmost row."
	elif state == "setupAttacker":
			if inputcount <= unitcountattacker:
				if tilemousepos.y == 5 or tilemousepos.y == 4:
					if attackertilemap.get_cell_source_id(Vector2i(tilemousepos.x, tilemousepos.y)) != 0:
						attackertilemap.set_cell(tilemousepos, 0, Vector2i(0,0)) 
						attackingUnits[inputcount] = Vector2i(tilemousepos.x, tilemousepos.y)
						inputcount+=1
						if inputcount == unitcountattacker:
							attackertilemap.enabled = false
							return true
				else:
					errlabel.text = "Error: Not a valid row."
	elif state == "defenderTurn":
		var currentPos = Vector2i(tilemousepos.x, tilemousepos.y)
		if doingspecial == true and dicerolled == 0:
			if validtilemap.get_cell_source_id(currentPos) == 3:
				doingspecial = false
				if attackertilemap.get_cell_source_id(currentPos) == 0:
					if removeAttacker(currentPos, 6):
						win(1)
				else:
					playertilemap.set_cell(currentPos, 5, Vector2i(0,0))
				clearSelected()
				return
			else:
				return
		if playertilemap.get_cell_source_id(currentPos) == 1:
			if unitselected == true and defendingUnitsMoved[positionselected] == false and defendingUnits[positionselected] == currentPos:
				defendingUnitsMoved[positionselected] = true
			else:
				clearSelected()
				positionselected = defendingUnits.find(currentPos)
				if defendingUnitsMoved[positionselected] == true:
					errlabel.text = "Unit already moved this turn."
					return
				unitselected = true
				for x in range (clampi(tilemousepos.x-2,-3, 4),clampi(tilemousepos.x+2,-3, 3)+1):
					if playertilemap.get_cell_source_id(Vector2i(x, -6)) != 1:
						validtilemap.set_cell(Vector2i(x, -6),3,Vector2i(0,0))
					elif Vector2i(x, -6) == currentPos:
						validtilemap.set_cell(Vector2i(x, -6),3,Vector2i(0,0))
				return
		if unitselected == true:
			if validtilemap.get_cell_source_id(currentPos) == 3:
				inputcount+=1
				playertilemap.set_cell(defendingUnits[positionselected], -1, Vector2i(0,0))
				defendingUnits[positionselected] = Vector2i(tilemousepos.x, tilemousepos.y)
				playertilemap.set_cell(defendingUnits[positionselected],1,Vector2i(0,0))
				defendingUnitsMoved[positionselected] = true
				#play gun noise
				clearSelected()
				if checkSightline(currentPos):
					win(1)
				if inputcount==2:
					return true
				return
		else:
			unitselected = false
			clearSelected()
		return
	elif state == "attackerTurn":
		var currentPos = Vector2i(tilemousepos.x, tilemousepos.y)
		if doingspecial == true and dicerolled == 0:
			if validtilemap.get_cell_source_id(currentPos) == 3:
				doingspecial = false
				if playertilemap.get_cell_source_id(currentPos) == 5:
					playertilemap.set_cell(currentPos, -1, Vector2i(0,0))
				elif playertilemap.get_cell_source_id(currentPos) == 6 or playertilemap.get_cell_source_id(currentPos) == 4:
					playertilemap.set_cell(currentPos, 7, Vector2i(0,0))
					var index = attackingUnits.find(currentPos)
					attackingUnits[index] = Vector2i(-100,-100) #bad fix
				else:
					playertilemap.set_cell(currentPos, 5, Vector2i(0,0))
				clearSelected()
			return
		if attackertilemap.get_cell_source_id(currentPos) == 0:
			if unitselected == true and attackingUnitsMoved[positionselected] == false and attackingUnits[positionselected] == currentPos:
				attackingUnitsMoved[positionselected] = true
			else:
				clearSelected()
				positionselected = attackingUnits.find(currentPos)
				if attackingUnitsMoved[positionselected] == true:
					errlabel.text = "Unit already moved this turn."
					return
				unitselected = true
				#highlight valid squares here
				#there is probably a better way to do this mathematically, maybe a loop with -1^n.
				validtilemap.set_cell(Vector2i(currentPos.x, currentPos.y), 3, Vector2i(0,0))
				if currentPos.y + 1 < 6 and cellPassable(Vector2i(currentPos.x, currentPos.y + 1)):
					validtilemap.set_cell(Vector2i(currentPos.x, currentPos.y + 1), 3, Vector2i(0,0))
				if currentPos.y - 1 > -6 and cellPassable(Vector2i(currentPos.x, currentPos.y - 1)):
					validtilemap.set_cell(Vector2i(currentPos.x, currentPos.y - 1), 3, Vector2i(0,0))
				if currentPos.x - 1 > -4 and cellPassable(Vector2i(currentPos.x - 1, currentPos.y)):
					validtilemap.set_cell(Vector2i(currentPos.x - 1, currentPos.y), 3, Vector2i(0,0))
				if currentPos.x + 1 < 4 and cellPassable(Vector2i(currentPos.x + 1, currentPos.y)):
					validtilemap.set_cell(Vector2i(currentPos.x + 1, currentPos.y), 3, Vector2i(0,0))
				return
		if unitselected == true:
			if validtilemap.get_cell_source_id(Vector2i(tilemousepos.x, tilemousepos.y)) == 3:
				inputcount+=1
				attackertilemap.set_cell(attackingUnits[positionselected], -1, Vector2i(0,0))
				attackingUnits[positionselected] = Vector2i(tilemousepos.x, tilemousepos.y)
				attackertilemap.set_cell(attackingUnits[positionselected],0,Vector2i(0,0))
				attackingUnitsMoved[positionselected] = true
				clearSelected()
				if attackingUnits[positionselected].y == -5:
					win(0)
				if inputcount==unitcountattacker:
					return true
		else:
			unitselected = false
			clearSelected()
	return false

func advanceState():
	var size = get_window().size
	acceptDialog.size.x = size.x
	acceptDialog.size.y = size.y
	inputcount = 0
	unitselected = false
	if state == "win":
		label.text = "Game Ended. Restart by pressing R."
		return
	clearSelected()
	passDevice()
	if state == "uninitialized":
		state = "setupDefender"
		label.text = "Defender Setup Turn: \nPlace two units on the topmost row."
		for x in range (-3,4):
			validtilemap.set_cell(Vector2i(x, -6),3,Vector2i(0,0))
		return
	if state == "setupDefender":
		state = "setupAttacker"
		label.text = "Attacker Setup Turn: \nPlace four units on the botton two rows."
		for x in range (-3,4):
			validtilemap.set_cell(Vector2i(x, 4),3,Vector2i(0,0))
			validtilemap.set_cell(Vector2i(x, 5),3,Vector2i(0,0))
		return
	if state == "setupAttacker" or state == "attackerTurn":
		resetTurn()
		rollDice()
		attackertilemap.enabled = false
		label.text = "Defender Turn: \nMove your units to destroy enemy units in that column."
		state = "defenderTurn"
		if dicerolled == 0:
			doingspecial = true
			dice.text = "Dice Effect: Place Impassable Tile"
			placeImpassable()
		else:
			dice.text = "Dice Effect: None"
		return
	if state == "defenderTurn":
		resetTurn()
		attackertilemap.enabled = true
		rollDice()
		label.text = "Attacker Turn: \nMove your units to reach the defender without being spotted."
		state = "attackerTurn"
		if dicerolled == 0:
			doingspecial = true
			dice.text = "Dice Effect: Place Or Remove Impassable Tile"
			placeOrDestroyImpassable()
		else:
			dice.text = "Dice Effect: None"
		return

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			errlabel.text = ""
			var mousepos = to_local(get_global_mouse_position())
			var tilemousepos = playertilemap.local_to_map(mousepos)
			if checkValid(tilemousepos) == true:
				advanceState()
	elif event is InputEventKey and event.keycode == KEY_R and event.pressed and state == "win":
		_ready()
