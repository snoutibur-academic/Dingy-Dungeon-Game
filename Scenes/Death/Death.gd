extends Node2D

func _ready():
	pass # Replace with function body.

func _on_main_menu_pressed():
	Game.playerHP = 100
	get_tree().change_scene_to_file("res://Scenes/Main/Main.tscn")