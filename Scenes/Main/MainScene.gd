extends Node2D

# UNUSED
"Load save menu"
func _on_no_load_button_pressed():
	get_tree().change_scene_to_file(("res:///Scenes/Levels/1Level.tscn"))

func _on_load_button_pressed():
	Utils.loadGame()
	get_tree().change_scene_to_file(("res:///Scenes/Levels/1Level.tscn"))


"Start Button"
func _on_start_button_pressed():
	get_tree().change_scene_to_file(("res:///Scenes/Levels/1Level.tscn"))
	Game.money = 0
	Game.atkDmgUpgradeCost = 10
	Game.plrAtkDmg = 1

	Game.waveDifficultyMultiplier = 1
	Game.mobCount = 0

	Game.healCost = 30

	Game.speedUpgradeCost = 20
	Game.playerSpeed = 35

	Game.wave = 0
	Game.dingyFunny = 1

func _on_start_from_save_pressed():
	Utils.loadGame()
	Game.mobCount = 0
	get_tree().change_scene_to_file(("res:///Scenes/Levels/1Level.tscn"))
