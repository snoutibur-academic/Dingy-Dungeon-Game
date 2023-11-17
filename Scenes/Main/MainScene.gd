extends Node2D

func _ready():
	Utils.loadGame()

"Start Game area"
func _on_start_player_detection_body_entered(body:Node2D):
	if body.name == "Player":
		if Utils.saveExists():
			print("Save file found!\nLOADING SAVE FILE")
		
		get_tree().change_scene_to_file(("res:///Scenes/Levels/DebugLevel.tscn"))
