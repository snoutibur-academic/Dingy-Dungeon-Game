extends Node

"Save/load system"
const SaveLocation = "res://DingusSaveData.bin" # Define save location

func saveGame():
	var file = FileAccess.open(SaveLocation, FileAccess.WRITE) # Access saveFileR for write

	# Data to store
	var data: Dictionary = {
		"money": Game.money,
		
		"playerHP": Game.playerHP,
		
		"plrAtkDmg": Game.plrAtkDmg,
		"atkDmgUpgradeCost": Game.atkDmgUpgradeCost,

		"wave": Game.wave,
		"dingyFunny": Game.dingyFunny,
		"waveDifficultyMultiplier": Game.waveDifficultyMultiplier,

		"speedUpgradeCost": Game.speedUpgradeCost,
		"playerSpeed": Game.playerSpeed,

		"healAmount": Game.healAmount,
		"healCost": Game.healCost,
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
				Game.money = curLine["money"]

				Game.playerHP = curLine["playerHP"]

				Game.plrAtkDmg = curLine["plrAtkDmg"]
				Game.atkDmgUpgradeCost = curLine["atkDmgUpgradeCost"]

				Game.wave = curLine["wave"]
				Game.dingyFunny = curLine["dingyFunny"]
				Game.waveDifficultyMultiplier = curLine["waveDifficultyMultiplier"]

				Game.speedUpgradeCost = curLine["speedUpgradeCost"]
				Game.playerSpeed = curLine["playerSpeed"]

				Game.healAmount = curLine["healAmount"]
				Game.healCost = curLine["healCost"]
