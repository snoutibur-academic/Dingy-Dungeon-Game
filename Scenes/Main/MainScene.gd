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
func _on_start_from_save_pressed():
	Utils.loadGame()
	get_tree().change_scene_to_file(("res:///Scenes/Levels/DebugLevel.tscn"))
