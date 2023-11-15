extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

"Start Game area"
func _on_start_player_detection_body_entered(body:Node2D):
	if body.name == "Player":
		get_tree().change_scene_to_file(("res:///Scenes/Levels/DebugLevel.tscn"))
