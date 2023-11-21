extends Node

"Save/load system"
const SaveLocation = "res://DingusSaveData.bin" # Define save location

var saveFileR = FileAccess.open(SaveLocation, FileAccess.READ) # Access saveFileR for read

func saveGame():
	var file = FileAccess.open(SaveLocation, FileAccess.WRITE) # Access saveFileR for write

	# Data to store
	var data: Dictionary = {
		"money": Game.money,
	}

	# Convert to json and write to saveFileR
	var jstr = JSON.stringify(data)
	file.store_line(jstr)

func loadGame():
	if saveFileR.file_exists(SaveLocation):
		if not saveFileR.eof_reached():
			var curLine = JSON.parse_string(saveFileR.get_line())
			if curLine:
				Game.money = curLine["money"]
		print("Save file loaded")

func saveExists():
	if saveFileR.file_exists(SaveLocation):
		return true
	else:
		return false
