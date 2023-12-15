extends Node

"Save/load system"
const SaveLocation = "res://DingusSaveData.bin" # Define save location

func saveGame():
	var file = FileAccess.open(SaveLocation, FileAccess.WRITE) # Access saveFileR for write

	# Data to store
	var data: Dictionary = {
		"playerHP": Game.playerHP,
		"money": Game.money,
		"plrAtkDmg": Game.plrAtkDmg,
		"atkDmgUpgradeCost": Game.atkDmgUpgradeCost,

		"wave": Game.wave,
		"dingyFunny": Game.dingyFunny,

		"healAmount": Game.healAmount,
		"healCost": Game.healCost,

		"speedUpgradeCost": Game.speedUpgradeCost
	}

	# Convert to json and write to saveFileR
	var jstr = JSON.stringify(data)
	file.store_line(jstr)

func loadGame():
	var file = FileAccess.open(SaveLocation, FileAccess.READ)
	#if saveFileR.file_exists(SaveLocation):
	if FileAccess.file_exists(SaveLocation) == true:
		if not file.eof_reached():
		#if not saveFileR.eof_reached():
			var curLine = JSON.parse_string(file.get_line())
			if curLine:
				Game.playerHP = curLine["playerHP"]
				Game.money = curLine["money"]

				Game.plrAtkDmg = curLine["plrAtkDmg"]
				Game.atkDmgUpgradeCost = curLine["atkDmgUpgradeCost"]

				Game.wave = curLine["wave"]
				Game.dingyFunny = curLine["dingyFunny"]

				Game.atkDmgUpgradeCost = curLine["atkDmgUpgradeCost"]
				Game.speedUpgradeCost = curLine["speedUpgradeCost"]

				Game.healAmount = curLine["healAmount"]
				Game.healCost = curLine["healCost"]
