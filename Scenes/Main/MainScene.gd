extends Node2D

func _ready():
	pass

"Start Game Area"
func _on_start_player_detection_body_entered(body:Node2D):
	if body.name == "Player":
		if Utils.loadGame(): # If player has an existing save file, ask if they wish to load it
			$LoadSave.show()
		else: 
			get_tree().change_scene_to_file(("res:///Scenes/Levels/DebugLevel.tscn"))


"Load save menu"
func _on_no_load_button_pressed():
	get_tree().change_scene_to_file(("res:///Scenes/Levels/DebugLevel.tscn"))

func _on_load_button_pressed():
	Utils.loadGame()
	get_tree().change_scene_to_file(("res:///Scenes/Levels/DebugLevel.tscn"))
